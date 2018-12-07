/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * @author MAHNUEL
 */
public class UtilidadesGenerales {
    public static byte[] streamToByteArray(InputStream stream) throws IOException {

    byte[] buffer = new byte[1024];
    ByteArrayOutputStream os = new ByteArrayOutputStream();
    
    int line = 0;
    // read bytes from stream, and store them in buffer
    while ((line = stream.read(buffer)) != -1) {
        // Writes bytes from byte array (buffer) into output stream.
        os.write(buffer, 0, line);
    }
    stream.close();
    os.flush();
    os.close();
    return os.toByteArray();
}
}
