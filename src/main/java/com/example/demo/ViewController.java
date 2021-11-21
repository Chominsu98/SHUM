package com.example.demo;

import jssc.SerialPort;
import jssc.SerialPortException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ViewController {

    @GetMapping("/")
    public String mainPage() {
        return "main.html";
    }

    @GetMapping("/nearBooth")
    public String nearBooth() {
        System.out.println("serial 통신");
        SerialPort serialPort = new SerialPort("COM7");
        try {
            if (serialPort.openPort())
                serialPort.closePort();
            serialPort.openPort();//Open serial port
            serialPort.setParams(SerialPort.BAUDRATE_9600,
                    SerialPort.DATABITS_8,
                    SerialPort.STOPBITS_1,
                    SerialPort.PARITY_NONE, false, false);//Set params. Also you can set params by this string: serialPort.setParams(9600, 8, 1, 0);
            serialPort.writeString("10");//Write data to por@rnjswt
            //serialPort.closePort();//Close serial port
        } catch (SerialPortException ex) {
            System.out.println(ex);
        }

        return "nearBoothPage.html";
    }
}
