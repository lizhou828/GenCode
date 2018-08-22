# GenCode for SpringMybatis


## Framework intro

    JDK                 1.7
    Tomcate             apache-tomcat-8.0.43
    Spring              4.2.0
    Mybatis             3.4.1
    Rapid-Framework     3.5.0.1


## 目录介绍

路径名称|路径名称说明|
 --- | --- |
src| 代码生成器的源码|
test| 代码生成器的测试代码|
template |代码生成器的模板|


## 接入须知

### 1、配置

    所有的配置都在：src/main/resources/generator.properties 配置文件中

### 2、启动方式

    在当前项目下的src/main/java/cn/org/rapid_framework/generator/GeneratorMain.java文件,以main方法的方式启动项目。


### 3、项目中必须的依赖

    		<dependency>
    			<groupId>org.mybatis</groupId>
    			<artifactId>mybatis</artifactId>
    			<version>3.4.4</version>
    		</dependency>
    		<dependency>
    			<groupId>tk.mybatis</groupId>
    			<artifactId>mapper</artifactId>
    			<version>3.2.1</version>
    		</dependency>
    		<dependency>
    			<groupId>com.alibaba</groupId>
    			<artifactId>druid</artifactId>
    			<version>1.0.13</version>
    		</dependency>
    		<dependency>
    			<groupId>org.mybatis</groupId>
    			<artifactId>mybatis-spring</artifactId>
    			<version>1.3.1</version>
    		</dependency>
    		<dependency>
    			<groupId>mysql</groupId>
    			<artifactId>mysql-connector-java</artifactId>
    			<version>${version.mysql}</version>
    		</dependency>
    		<dependency>
    			<groupId>org.springframework</groupId>
    			<artifactId>spring-tx</artifactId>
    			<version>4.3.14.RELEASE</version>
    		</dependency>
    		<dependency>
    			<groupId>org.springframework</groupId>
    			<artifactId>spring-jdbc</artifactId>
    			<version>4.3.14.RELEASE</version>
    		</dependency>

    		<!-- https://mvnrepository.com/artifact/com.github.pagehelper/pagehelper -->
    		<dependency>
    			<groupId>com.github.pagehelper</groupId>
    			<artifactId>pagehelper</artifactId>
    			<version>5.1.2</version>
    		</dependency>

