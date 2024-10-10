package com.bankmega.ccbmagent.document.components;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

@Component
public class FileComponent {

    public ResponseEntity<InputStreamResource> downloadFrom(String pathLocationFile) throws Exception {
        Path path = Paths.get(pathLocationFile);
        File file = path.toFile();
        try {
            InputStreamResource resource = new InputStreamResource(Files.newInputStream(path));

            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + file.getName());
            headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE);

            System.out.println("FILENAME: " + file.getName());

            return ResponseEntity.ok()
                    .headers(headers)
                    .contentLength(file.length())
                    .body(resource);

        } catch (IOException e) {
            System.out.println("IO EXCEPTION: " + e.getMessage());
            throw new Exception("IO EXCEPTION");
        }
    }
}
