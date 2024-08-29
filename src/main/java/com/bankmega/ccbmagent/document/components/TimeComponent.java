package com.bankmega.ccbmagent.document.components;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Component;

/**
 * Component For Get Time and Date
 */
@Component
public class TimeComponent {

    /**
     * Method for get timestamp with default pattern of yyyy-MM-dd hh:mm:ss a
     *
     * @return String timestamp
     *
     * @author John Sung (23020224)
     */
    public String getTimeStamp() {
        // Get the current date and time
        LocalDateTime now = LocalDateTime.now();

        // Define the format
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss a");

        // Format the current date and time
        String formattedNow = now.format(formatter);

        // Print the formatted date and time
        System.out.println("Current Timestamp:" + formattedNow);
        return formattedNow;
    }

    /**
     * Method for get timestamp with parameterized pattern
     *
     * @param pattern DateTime Pattern (Example: "yyyy-MM-dd HH:mm:ss")
     * @return String timestamp
     *
     * @author John Sung (23020224)
     */
    public String getTimeStamp(String pattern) {
        // Get the current date and time
        LocalDateTime now = LocalDateTime.now();

        // Define the format
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);

        // Format the current date and time
        String formattedNow = now.format(formatter);

        // Print the formatted date and time
        System.out.println("Current Timestamp:" + formattedNow);
        return formattedNow;
    }
}
