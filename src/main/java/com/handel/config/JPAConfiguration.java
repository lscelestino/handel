package com.handel.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class JPAConfiguration {

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource) {
		LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();

		factoryBean.setJpaVendorAdapter(vendorAdapter);
		factoryBean.setDataSource(dataSource);

		Properties props = aditionalProperties();

		factoryBean.setJpaProperties(props);
		factoryBean.setPackagesToScan("com.handel.models");

		return factoryBean;
	}

	@Bean
	@Profile("dev")
	public DataSource dataSource() {

		/**
		 * DriverManagerDataSource dataSource = new DriverManagerDataSource();
		 * dataSource.setUsername("sa"); dataSource.setPassword("");
		 * dataSource.setUrl("jdbc:h2:mem:dev;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_DELAY=-1;DATABASE_TO_UPPER=false");
		 * dataSource.setDriverClassName("org.h2.Driver");
		 **/
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setUsername("admin");
		dataSource.setPassword("one.old.car-190");
		dataSource.setUrl("jdbc:mysql://localhost/handel");
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");

		return dataSource;
	}

	private Properties aditionalProperties() {
		Properties props = new Properties();
		props.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
		props.setProperty("hibernate.show_sql", "true");
		// props.setProperty("hibernate.hbm2ddl.auto", "update");
		return props;
	}

	@Bean
	public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
		return new JpaTransactionManager(emf);
	}

}
