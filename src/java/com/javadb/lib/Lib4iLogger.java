/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javadb.lib;

/**
 *
 * @author junnguyen
 */
public class Lib4iLogger {

    private static final boolean isLoggerActive = true;

    public static void log(String logMsg) {

        if (isLoggerActive) {
            System.out.println(logMsg);
        }
    }

}
