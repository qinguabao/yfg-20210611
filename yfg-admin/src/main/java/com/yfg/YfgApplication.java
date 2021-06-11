package com.yfg;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableMBeanExport;
import org.springframework.context.annotation.Import;
import org.springframework.jmx.support.RegistrationPolicy;

import com.github.tobato.fastdfs.FdfsClientConfig;
import com.whty.model.socket.TcpServer;


//import com.github.tobato.fastdfs.FdfsClientConfig;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
@MapperScan({"com.yfg.*.mapper","com.whty.*.mapper"})

@EnableMBeanExport(registration = RegistrationPolicy.IGNORE_EXISTING)
@Import(FdfsClientConfig.class)

@ComponentScan(basePackages={"com.whty.*","com.yfg.*"})
public class YfgApplication implements CommandLineRunner
//public class RuoYiApplication
{
	
	@Autowired
	private TcpServer tcpServer;
	
    public static void main(String[] args)
    {
//         System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(YfgApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  若依启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                " .-------.       ____     __        \n" +
                " |  _ _   \\      \\   \\   /  /    \n" +
                " | ( ' )  |       \\  _. /  '       \n" +
                " |(_ o _) /        _( )_ .'         \n" +
                " | (_,_).' __  ___(_ o _)'          \n" +
                " |  |\\ \\  |  ||   |(_,_)'         \n" +
                " |  | \\ `'   /|   `-'  /           \n" +
                " |  |  \\    /  \\      /           \n" +
                " ''-'   `'-'    `-..-'              ");
    }
    @Override
	public void run(String... args) throws Exception {
		
		//netty-tcp
//		log.info("TcpServer is startting ...... tcpPort -> [" + tcpServer.getTcpSocketAddress().getPort() + "]");

    	Thread th = new Thread(tcpServer);
    	th.start();
		System.out.println("TcpServer is startting ...... tcpPort -> [" + tcpServer.getTcpSocketAddress().getPort() + "]");
	}
}