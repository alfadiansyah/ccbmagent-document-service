package com.bankmega.ccbmagent.document.config;

import java.util.UUID;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.type.JdbcType;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import com.bankmega.ccbmagent.document.util.UUIDTypeHandler;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@MapperScan(basePackages = "com.bankmega.ccbmagent.document.mappers", sqlSessionFactoryRef = "sqlSessionFactoryMaster")
public class MasterDatabaseConfig {

    @Bean
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource masterDataSource() {
        return new HikariDataSource();
    }

    @Bean
    @Primary
    public SqlSessionFactory sqlSessionFactoryMaster(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
        sessionFactoryBean.setDataSource(dataSource);

        // Register the UUIDTypeHandler
        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();
        configuration.getTypeHandlerRegistry().register(UUID.class, JdbcType.VARCHAR, new UUIDTypeHandler());
        sessionFactoryBean.setConfiguration(configuration);

        return sessionFactoryBean.getObject();
    }

    @Bean
    @Primary
    public SqlSessionTemplate sqlSessionTemplateMaster(SqlSessionFactory sqlSessionFactoryMaster) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactoryMaster);
    }
}

