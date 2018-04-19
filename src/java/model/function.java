/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.DateFormat;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author PC
 */
public class function {

    public static boolean isValidNum(String str) {
        return str.matches("-?\\d+(\\.\\d+)?");  //kiem tra so thap phan
    }

    public static boolean kiemtraSoDuong(String str) {
        return !(Float.parseFloat(str) < 0.0 || Float.parseFloat(str) > 10);
    }

    public static boolean isValidName(String validation_name) {
        String regx = "^[a-zA-Z \\-\\.\\'\\á\\à\\ả\\ã\\ạ\\ă\\ắ\\ằ\\ẳ\\ẵ\\ặ\\â\\ấ\\ầ\\ẩ\\ẫ\\ậ\\Á\\À\\Ả\\Ã\\Ạ\\Ă\\Ắ\\Ằ\\Ẳ\\Ẵ\\Ặ\\Â\\Ấ\\Ầ\\Ẩ\\Ẫ\\Ậ\\é\\è\\ẻ\\ẽ\\ẹ\\ê\\ế\\ề\\ể\\ễ\\ệ\\É\\È\\Ẻ\\Ẽ\\Ẹ\\Ê\\Ế\\Ề\\Ể\\Ễ\\Ệ\\í\\ì\\ỉ\\ĩ\\ị\\Í\\Ì\\Ỉ\\Ĩ\\Ị\\ó\\ò\\ỏ\\õ\\ọ\\ô\\ố\\ồ\\ổ\\ỗ\\ộ\\ơ\\ớ\\ờ\\ở\\ỡ\\ợ\\Ó\\Ò\\Ỏ\\Õ\\Ọ\\Ô\\Ố\\Ồ\\Ổ\\Ỗ\\Ộ\\Ơ\\Ớ\\Ờ\\Ở\\Ỡ\\Ợ\\ú\\ù\\ủ\\ũ\\ụ\\ư\\ứ\\ừ\\ử\\ữ\\ự\\Ú\\Ù\\Ủ\\Ũ\\Ụ\\Ư\\Ứ\\Ừ\\Ử\\Ữ\\Ự\\ý\\ỳ\\ỷ\\ỹ\\ỵ\\Ý\\Ỳ\\Ỷ\\Ỹ\\Ỵ\\đ\\Đ]*$";
        Pattern pattern = Pattern.compile(regx, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(validation_name);
        return matcher.find();
    }

    public static String Inhoa(String inhoa) {
        String str = inhoa;
        StringBuffer stringbf = new StringBuffer();
        Matcher m = Pattern.compile("([a-z\\-\\.\\'\\á\\à\\ả\\ã\\ạ\\ă\\ắ\\ằ\\ẳ\\ẵ\\ặ\\â\\ấ\\ầ\\ẩ\\ẫ\\ậ\\Á\\À\\Ả\\Ã\\Ạ\\Ă\\Ắ\\Ằ\\Ẳ\\Ẵ\\Ặ\\Â\\Ấ\\Ầ\\Ẩ\\Ẫ\\Ậ\\é\\è\\ẻ\\ẽ\\ẹ\\ê\\ế\\ề\\ể\\ễ\\ệ\\É\\È\\Ẻ\\Ẽ\\Ẹ\\Ê\\Ế\\Ề\\Ể\\Ễ\\Ệ\\í\\ì\\ỉ\\ĩ\\ị\\Í\\Ì\\Ỉ\\Ĩ\\Ị\\ó\\ò\\ỏ\\õ\\ọ\\ô\\ố\\ồ\\ổ\\ỗ\\ộ\\ơ\\ớ\\ờ\\ở\\ỡ\\ợ\\Ó\\Ò\\Ỏ\\Õ\\Ọ\\Ô\\Ố\\Ồ\\Ổ\\Ỗ\\Ộ\\Ơ\\Ớ\\Ờ\\Ở\\Ỡ\\Ợ\\ú\\ù\\ủ\\ũ\\ụ\\ư\\ứ\\ừ\\ử\\ữ\\ự\\Ú\\Ù\\Ủ\\Ũ\\Ụ\\Ư\\Ứ\\Ừ\\Ử\\Ữ\\Ự\\ý\\ỳ\\ỷ\\ỹ\\ỵ\\Ý\\Ỳ\\Ỷ\\Ỹ\\Ỵ\\đ\\Đ])([a-z\\-\\.\\'\\á\\à\\ả\\ã\\ạ\\ă\\ắ\\ằ\\ẳ\\ẵ\\ặ\\â\\ấ\\ầ\\ẩ\\ẫ\\ậ\\Á\\À\\Ả\\Ã\\Ạ\\Ă\\Ắ\\Ằ\\Ẳ\\Ẵ\\Ặ\\Â\\Ấ\\Ầ\\Ẩ\\Ẫ\\Ậ\\é\\è\\ẻ\\ẽ\\ẹ\\ê\\ế\\ề\\ể\\ễ\\ệ\\É\\È\\Ẻ\\Ẽ\\Ẹ\\Ê\\Ế\\Ề\\Ể\\Ễ\\Ệ\\í\\ì\\ỉ\\ĩ\\ị\\Í\\Ì\\Ỉ\\Ĩ\\Ị\\ó\\ò\\ỏ\\õ\\ọ\\ô\\ố\\ồ\\ổ\\ỗ\\ộ\\ơ\\ớ\\ờ\\ở\\ỡ\\ợ\\Ó\\Ò\\Ỏ\\Õ\\Ọ\\Ô\\Ố\\Ồ\\Ổ\\Ỗ\\Ộ\\Ơ\\Ớ\\Ờ\\Ở\\Ỡ\\Ợ\\ú\\ù\\ủ\\ũ\\ụ\\ư\\ứ\\ừ\\ử\\ữ\\ự\\Ú\\Ù\\Ủ\\Ũ\\Ụ\\Ư\\Ứ\\Ừ\\Ử\\Ữ\\Ự\\ý\\ỳ\\ỷ\\ỹ\\ỵ\\Ý\\Ỳ\\Ỷ\\Ỹ\\Ỵ\\đ\\Đ]*)",
                Pattern.CASE_INSENSITIVE).matcher(str);
        while (m.find()) {
            m.appendReplacement(stringbf,
                    m.group(1).toUpperCase() + m.group(2).toLowerCase());
        }
        String a = m.appendTail(stringbf).toString();
        return a;
    }

    public static String Bodau(String s) {
        String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(temp).replaceAll("");
    }

    public static String Date(String format) {
//        String format = "dd/MM/yyyy";
        DateFormat dateFormat = new SimpleDateFormat(format);
        Date date = new Date();
        String day = dateFormat.format(date);
        return day;
    }
}
