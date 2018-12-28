package com.njgibbon.test.junit.shellLogTest;

import org.junit.jupiter.api.Test;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class TestSuite2 {

    @Test
    void justAnExample() throws Exception {
        System.out.println("This test method should be run");
        Process p;
        StringBuffer sb = new StringBuffer();

        p = Runtime.getRuntime().exec("ls");
        p.waitFor();

        BufferedReader reader =
                new BufferedReader(new InputStreamReader(p.getInputStream()));

        String line = "";
        while ((line = reader.readLine())!= null) {
            sb.append(line + "\n");
        }

        System.out.println(sb.toString());
    }
}
