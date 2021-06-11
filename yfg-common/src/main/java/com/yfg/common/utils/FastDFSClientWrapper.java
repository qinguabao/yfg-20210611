package com.yfg.common.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.github.tobato.fastdfs.domain.StorePath;
import com.github.tobato.fastdfs.exception.FdfsUnsupportStorePathException;
import com.github.tobato.fastdfs.service.FastFileStorageClient;







/**
 * <p>Description: FastDFS文件上传下载包装类</p>
 * <p>Copyright: Copyright (c) 2017</p>
 *
 * @author fuweidong
 * @version 1.0
 * @date 2017/11/16
 */
@Component
public class FastDFSClientWrapper {
	  private final Logger logger = LoggerFactory.getLogger(FastDFSClientWrapper.class);

	  @Autowired
	  private FastFileStorageClient storageClient;

	  public void testupload()
	    throws Exception
	  {
	    File file = new File("F:\\05-zoopkeeper\\聚联18年1月KPI考核_秦晨晖.xlsx");
	    System.out.println(uploadFile(file));
	  }

	  public String uploadFile(File file)
	    throws IOException
	  {
	    InputStream input = new FileInputStream(file);
	    StorePath storePath = this.storageClient.uploadFile(input, file.length(), FilenameUtils.getExtension(file.getName()), null);

	    input.close();
	    return getResAccessUrl(storePath);
	  }

	  public String uploadFileByBase64(Map<String, Object> map)
	    throws IOException
	  {
	    StorePath storePath = this.storageClient.uploadFile((InputStream)map.get("fileInputStream"), Long.valueOf(map.get("fileLength").toString()).longValue(), (String)map.get("extension"), null);

	    return getResAccessUrl(storePath);
	  }

	  public String uploadFileByMulti(MultipartFile file) throws IOException
	  {
	    StorePath storePath = this.storageClient.uploadFile(file.getInputStream(), file.getSize(), FilenameUtils.getExtension(file.getOriginalFilename()), null);

	    return getResAccessUrl(storePath);
	  }

	  public String uploadFile(String content, String fileExtension)
	  {
	    byte[] buff = content.getBytes(Charset.forName("UTF-8"));
	    ByteArrayInputStream stream = new ByteArrayInputStream(buff);
	    StorePath storePath = this.storageClient.uploadFile(stream, buff.length, fileExtension, null);
	    return getResAccessUrl(storePath);
	  }

	  private String getResAccessUrl(StorePath storePath)
	  {
	    return storePath.getFullPath();
	  }

	  public void deleteFile(String fileUrl)
	  {
	    if (StringUtils.isEmpty(fileUrl))
	      return;
	    try
	    {
	      StorePath storePath = StorePath.praseFromUrl(fileUrl);
	      this.storageClient.deleteFile(storePath.getGroup(), storePath.getPath());
	    } catch (FdfsUnsupportStorePathException e) {
	      this.logger.warn(e.getMessage());
	    }
	  }

	  public void downloadFile(String groupName, String ser_path) {
	    this.storageClient.downloadFile(groupName, ser_path, null);
	  }

	  public File downloadFile(String fileUrl)
	  {
	    File uploadFile = new File(IdGenerator.getRanId()+ ".jpeg");
	    BufferedInputStream bis = null;
	    try {
	      URL url = new URL(fileUrl);
	      HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	      conn.setDoInput(true);
	      conn.setRequestMethod("GET");
	      bis = new BufferedInputStream(conn.getInputStream());
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    try
	    {
	      BufferedOutputStream fos = new BufferedOutputStream(new FileOutputStream(uploadFile));
	      byte[] buf = new byte[8096];
	      int size = 0;
	      while ((size = bis.read(buf)) != -1)
	        fos.write(buf, 0, size);
	      fos.close();
	      bis.close();
	    } catch (FileNotFoundException e) {
	      e.printStackTrace();
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
	    return uploadFile;
	  }

	  public String encodeBase64File(String path) {
	    try {
	      File file = new File(path);
	      FileInputStream inputFile = new FileInputStream(file);
	      byte[] buffer = new byte[(int)file.length()];
	      inputFile.read(buffer);
	      inputFile.close();
	      return Base64.encodeBase64String(buffer);
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return null;
	  }
}