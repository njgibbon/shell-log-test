package com.njgibbon.test.junit.shellLogTest.suites;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;
import com.njgibbon.test.junit.shellLogTest.common.ShellLogTest;

public class TestSuite1
{

    @Test
    void test1() throws Exception
    {
        System.out.println("test1");
        boolean testResult = false;
        ShellLogTest slt = new ShellLogTest();
        testResult = slt.assertAgainstLog("SUCCESS");
        assertTrue(testResult);
    }


    @Test
    void test2() throws Exception
    {
        System.out.println("test2");
        boolean testResult = false;
        ShellLogTest slt = new ShellLogTest();
        testResult = slt.assertAgainstLog("SUCCESS");
        assertTrue(testResult);
    }

    @Test
    void test3() throws Exception
    {
        System.out.println("test3");
        boolean testResult = false;
        ShellLogTest slt = new ShellLogTest();
        testResult = slt.assertAgainstLog("SUCCESS");
        assertTrue(testResult);
    }

    @Test
    void test4() throws Exception
    {
        System.out.println("test4");
        boolean testResult = false;
        ShellLogTest slt = new ShellLogTest();
        testResult = slt.assertAgainstLog("SUCCESS");
        assertTrue(testResult);
    }

    @Test
    void test5() throws Exception
    {
        System.out.println("test5");
        boolean testResult = false;
        ShellLogTest slt = new ShellLogTest();
        testResult = slt.assertAgainstLog("SUCCESS");
        assertTrue(testResult);
    }

}
