package com.njgibbon.test.junit.shellLogTest.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class ShellLogTest
{

    public void extractLog(String id) throws Exception
    {
        Process p;
        StringBuffer sb;
        String line;
        BufferedReader reader;
        ProcessBuilder pb;

        //part2
        pb = new ProcessBuilder("./extractLog.sh", id);
        p = pb.start();
        p.waitFor();

        reader = new BufferedReader(new InputStreamReader(p.getInputStream()));

        line = "";
        sb = new StringBuffer();
        while ((line = reader.readLine())!= null) {
            sb.append(line + "\n");
        }

        System.out.println(sb.toString());
    }

    public boolean assertAgainstLog(String stringToMatch) throws Exception
    {
        Process p;
        StringBuffer sb;
        String line;
        BufferedReader reader;
        ProcessBuilder pb;
        int exitStatus;

        //part2
        pb = new ProcessBuilder("./assertAgainstLog.sh", stringToMatch);
        p = pb.start();
        p.waitFor();

        exitStatus = p.exitValue();


        reader = new BufferedReader(new InputStreamReader(p.getInputStream()));

        line = "";
        sb = new StringBuffer();
        while ((line = reader.readLine())!= null) {
            sb.append(line + "\n");
        }

        System.out.println(sb.toString());

        if (exitStatus == 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
