/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.controller.web.job;


import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;
import java.util.logging.Level;

public class logger {
    private static Logger logger = Logger.getLogger(logger.class.getName());
    private static FileHandler fileHandler;

    static {
        try {
            // Tạo FileHandler để ghi log vào file
            fileHandler = new FileHandler("application.log", true); // true để ghi tiếp vào file
            logger.addHandler(fileHandler);

            // Thiết lập định dạng cho log
            SimpleFormatter formatter = new SimpleFormatter();
            fileHandler.setFormatter(formatter);

            // Đặt mức log
            logger.setLevel(Level.ALL);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void logInfo(String message) {
        logger.info(message);
    }

    public static void logWarning(String message) {
        logger.warning(message);
    }

    public static void logSevere(String message) {
        logger.severe(message);
    }

    public static void logException(String message, Exception e) {
        logger.log(Level.SEVERE, message, e);
    }
}

