package com.bankmega.ccbmagent.document.components;

import org.springframework.stereotype.Component;

/**
 * Component For String Manipulation
 */
@Component
public class StringComponent {

    /**
     * Method for join multiple string with space between each array
     *
     * Example Usage = stringComponent
     * .joinStringWithSpace(new String[]{"nama","saya", "budi"})
     *
     * Return: "nama saya budi"
     *
     * @param args: array of string
     * @return string separated by space
     *
     * @author John Sung (23020224)
     */
    public String joinStringWithSpace(String[] args) {
        String result = "";
        int iteration = 0;
        for (String str : args) {
            if (iteration == 0) {
                result = str;
            } else {
                result = result + " " + str;
            }
            iteration++;
        }
        return result;
    }
}
