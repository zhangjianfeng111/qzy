package com.qzy.cn.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;


/**
 * @author zgdcool
 * @version 2015年1月12日 上午11:55:46
 * 
 *                             _ooOoo_
 *                            o8888888o
 *                            88" . "88
 *                            (| -_- |)
 *                            O\  =  /O
 *                         ____/`---'\____
 *                       .'  \\|     |//  `.
 *                      /  \\|||  :  |||//  \
 *                     /  _||||| -:- |||||-  \
 *                     |   | \\\  -  /// |   |
 *                     | \_|  ''\---/''  |   |
 *                     \  .-\__  `-`  ___/-. /
 *                   ___`. .'  /--.--\  `. . __
 *                ."" '<  `.___\_<|>_/___.'  >'"".
 *               | | :  `- \`.;`\ _ /`;.`/ - ` : | |
 *               \  \ `-.   \_ __\ /__ _/   .-` /  /
 *          ======`-.____`-.___\_____/___.-`____.-'======
 *                             `=---='
 *          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 *                     佛祖保佑        永无BUG
 *            佛曰:  
 *                   写字楼里写字间，写字间里程序员；  
 *                   程序人员写程序，又拿程序换酒钱。  
 *                   酒醒只在网上坐，酒醉还来网下眠；  
 *                   酒醉酒醒日复日，网上网下年复年。  
 *                   但愿老死电脑间，不愿鞠躬老板前；  
 *                   奔驰宝马贵者趣，公交自行程序员。  
 *                   别人笑我忒疯癫，我笑自己命太贱；  
 *                   不见满街漂亮妹，哪个归得程序员？  
 */
public class ZipToFile {
	public static final String ZIP_FILENAME = "/Users/zgdcool/Desktop/html/";//需要解压缩的文件名  
    public static final String ZIP_DIR = "/Users/zgdcool/Desktop/html/";//需要压缩的文件夹  
    public static final String UN_ZIP_DIR = "/Users/zgdcool/Desktop/";//要解压的文件目录  
    public static final int BUFFER = 1024 ;//缓存大小  
      
    /** 
    * zip压缩功能. 
    * 压缩baseDir(文件夹目录)下所有文件，包括子目录 
    * @throws Exception 
    */  
    public static void zipFile(String baseDir,String fileName) throws Exception{  
    	List<File> fileList=getSubFiles(new File(baseDir));  
        ZipOutputStream zos=new ZipOutputStream(new FileOutputStream(fileName));  
        ZipEntry ze=null;  
        byte[] buf=new byte[BUFFER];  
        int readLen=0;  
        for(int i = 0; i <fileList.size(); i++) {  
            File f=(File)fileList.get(i);  
            ze=new ZipEntry(getAbsFileName(baseDir, f));  
            ze.setSize(f.length());  
            ze.setTime(f.lastModified());     
            zos.putNextEntry(ze);  
            InputStream is=new BufferedInputStream(new FileInputStream(f));  
            while ((readLen=is.read(buf, 0, BUFFER))!=-1) {  
                zos.write(buf, 0, readLen);  
            }  
            is.close();  
        }  
        zos.close();  
    }  
      
    /** 
    * 给定根目录，返回另一个文件名的相对路径，用于zip文件中的路径. 
    * @param baseDir java.lang.String 根目录 
    * @param realFileName java.io.File 实际的文件名 
    * @return 相对文件名 
    */  
    private static String getAbsFileName(String baseDir, File realFileName){  
        File real=realFileName;  
        File base=new File(baseDir);  
        String ret=real.getName();  
        while (true) {  
            real=real.getParentFile();  
            if(real==null)   
                break;  
            if(real.equals(base))   
                break;  
            else  
                ret=real.getName()+"/"+ret;  
        }  
        return ret;  
    }  
      
    /** 
    * 取得指定目录下的所有文件列表，包括子目录. 
    * @param baseDir File 指定的目录 
    * @return 包含java.io.File的List 
    */  
    private static List<File> getSubFiles(File baseDir){  
        List<File> ret=new ArrayList<File>();  
        File[] tmp=baseDir.listFiles();  
        for (int i = 0; i <tmp.length; i++) {  
            if(tmp[i].isFile())  
                ret.add(tmp[i]);  
            if(tmp[i].isDirectory())  
                ret.addAll(getSubFiles(tmp[i]));  
        }  
        return ret;  
    }  
      
    /** 
    * 解压缩功能. 
    * 将ZIP_FILENAME文件解压到ZIP_DIR目录下. 
    * @throws Exception 
    */  
    public static void upZipFile() throws Exception{  
        ZipFile zfile=new ZipFile(ZIP_FILENAME);  
        Enumeration<?> zList=zfile.entries();  
        ZipEntry ze=null;  
        byte[] buf=new byte[1024];  
        while(zList.hasMoreElements()){  
            ze=(ZipEntry)zList.nextElement();         
            if(ze.isDirectory()){  
                File f=new File(ZIP_DIR+ze.getName());  
                f.mkdir();  
                continue;  
            }  
            OutputStream os=new BufferedOutputStream(new FileOutputStream(getRealFileName(ZIP_DIR, ze.getName())));  
            InputStream is=new BufferedInputStream(zfile.getInputStream(ze));  
            int readLen=0;  
            while ((readLen=is.read(buf, 0, 1024))!=-1) {  
                os.write(buf, 0, readLen);  
            }  
            is.close();  
            os.close();   
        }  
        zfile.close();  
    }  
  
    /** 
    * 给定根目录，返回一个相对路径所对应的实际文件名. 
    * @param baseDir 指定根目录 
    * @param absFileName 相对路径名，来自于ZipEntry中的name 
    * @return java.io.File 实际的文件 
    */  
    public static File getRealFileName(String baseDir, String absFileName){  
        String[] dirs=absFileName.split("/");  
        File ret=new File(baseDir);  
        if(dirs.length>1){  
            for (int i = 0; i < dirs.length-1;i++) {  
                ret=new File(ret, dirs[i]);  
            }  
            if(!ret.exists())  
                ret.mkdirs();  
            ret=new File(ret, dirs[dirs.length-1]);  
            return ret;  
        }  
        return ret;  
    }  
    
    public static void main(String[] args) throws Exception {
    	zipFile(ZIP_DIR, UN_ZIP_DIR+"images");
	}
}
