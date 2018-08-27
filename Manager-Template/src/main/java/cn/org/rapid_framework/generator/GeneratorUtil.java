package cn.org.rapid_framework.generator;

import java.io.File;

/**
 * Created by lizhou on 2018年05月13日 11时58分
 */
public class GeneratorUtil {

    /* (默认的)生成代码的存放路径，当前项目的templateGenCode下 */
    public static final String DEFAULT_TEMPLATE_GEN_CODE_DIR = "templateGenCode";


    /**
     * 获取生成代码的存放的（默认）路径
     * @return
     */
    public static String getGenCodeDirFileName() {
        File file = getGenCodeDirFile();
        if(null == file || !file.exists()){
            return "";
        }
        return file.getAbsolutePath();

    }

    /**
     * 获取生成代码的存放的（默认）路径
     * @return
     */
    public static File getGenCodeDirFile() {

        String applicationPath = GeneratorUtil.class.getResource("/").getPath();
        int idx = applicationPath.lastIndexOf("/");
        applicationPath = applicationPath.substring(0, idx);
        idx = applicationPath.lastIndexOf("/");
        applicationPath = applicationPath.substring(0, idx);
        idx = applicationPath.lastIndexOf("/");
        applicationPath = applicationPath.substring(0, idx);


        File applicationFile = new File(applicationPath);
        File templateGenCodeFile = null;
        if(null != applicationFile && applicationFile.exists() && applicationFile.list().length > 0){
            for(File f : applicationFile.listFiles()){
                if(null == f || !f.exists()){
                    continue;
                }
                if(DEFAULT_TEMPLATE_GEN_CODE_DIR.equals(f.getName())){
                    templateGenCodeFile =  f;
                }
            }
        }
        if(null == templateGenCodeFile || !templateGenCodeFile.exists()){
            templateGenCodeFile = new File(applicationFile.getName() + "/" + DEFAULT_TEMPLATE_GEN_CODE_DIR);
            if(templateGenCodeFile.mkdir()){
                System.out.println("当前项目的" + DEFAULT_TEMPLATE_GEN_CODE_DIR + "目录创建成功！");
            }
        }
        return templateGenCodeFile;
    }
}
