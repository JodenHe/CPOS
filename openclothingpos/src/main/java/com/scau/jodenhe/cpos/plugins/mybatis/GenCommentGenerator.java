package com.scau.jodenhe.cpos.plugins.mybatis;

import java.util.Properties;

import org.mybatis.generator.api.CommentGenerator;
import org.mybatis.generator.api.IntrospectedColumn;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.dom.java.CompilationUnit;
import org.mybatis.generator.api.dom.java.Field;
import org.mybatis.generator.api.dom.java.InnerClass;
import org.mybatis.generator.api.dom.java.InnerEnum;
import org.mybatis.generator.api.dom.java.Method;
import org.mybatis.generator.api.dom.java.Parameter;
import org.mybatis.generator.api.dom.java.TopLevelClass;
import org.mybatis.generator.api.dom.xml.XmlElement;
import org.mybatis.generator.internal.util.StringUtility;

/**
 * 
 * <p>Title: 自定义注解</p>
 * <p>Description: 把数据库字段的注释作为生成的实体类字段注释</p>
 * <p>Company: scau</p>
 * <p>Copyright: 1.0</p>
 * @author jodenhe
 * @version 1.0
 * @since 2017年8月28日 下午8:59:58
 */
public class GenCommentGenerator implements CommentGenerator {

	public GenCommentGenerator() {
		super();
	}

	/**
	 * 给字段添加数据库备注
	 * 
	 * @param field
	 * @param introspectedTable
	 * @param introspectedColumn
	 */
	@Override
	public void addFieldComment(Field field, IntrospectedTable introspectedTable,
			IntrospectedColumn introspectedColumn) {
		if (StringUtility.stringHasValue(introspectedColumn.getRemarks())) {
			field.addJavaDocLine("//" + introspectedColumn.getRemarks());
		}
	}

	/**
	 * getter方法注释
	 * 
	 * @param method
	 * @param introspectedTable
	 * @param introspectedColumn
	 */
	@Override
	public void addGetterComment(Method method, IntrospectedTable introspectedTable,
			IntrospectedColumn introspectedColumn) {
		StringBuilder sb = new StringBuilder();
		method.addJavaDocLine("/**");
		if (StringUtility.stringHasValue(introspectedColumn.getRemarks())) {
			sb.append(" * 获取");
			sb.append(introspectedColumn.getRemarks());
			method.addJavaDocLine(sb.toString());
			method.addJavaDocLine(" *");
		}
		sb.setLength(0);
		sb.append(" * @return ");
		sb.append(introspectedColumn.getActualColumnName());
		if (StringUtility.stringHasValue(introspectedColumn.getRemarks())) {
			sb.append(" - ");
			sb.append(introspectedColumn.getRemarks());
		}
		method.addJavaDocLine(sb.toString());
		method.addJavaDocLine(" */");
	}

	/**
	 * setter方法注释
	 * 
	 * @param method
	 * @param introspectedTable
	 * @param introspectedColumn
	 */
	@Override
	public void addSetterComment(Method method, IntrospectedTable introspectedTable,
			IntrospectedColumn introspectedColumn) {
		StringBuilder sb = new StringBuilder();
		method.addJavaDocLine("/**");
		if (StringUtility.stringHasValue(introspectedColumn.getRemarks())) {
			sb.append(" * 设置");
			sb.append(introspectedColumn.getRemarks());
			method.addJavaDocLine(sb.toString());
			method.addJavaDocLine(" *");
		}
		Parameter parm = method.getParameters().get(0);
		sb.setLength(0);
		sb.append(" * @param ");
		sb.append(parm.getName());
		if (StringUtility.stringHasValue(introspectedColumn.getRemarks())) {
			sb.append(" ");
			sb.append(introspectedColumn.getRemarks());
		}
		method.addJavaDocLine(sb.toString());
		method.addJavaDocLine(" */");
	}

	/**
	 * xml中的注释
	 * 
	 * @param xmlElement
	 */
	@Override
	public void addComment(XmlElement xmlElement) {
	}

	@Override
	public void addJavaFileComment(CompilationUnit compilationUnit) {
		return;
	}

	@Override
	public void addRootComment(XmlElement rootElement) {
		return;
	}

	@Override
	public void addConfigurationProperties(Properties properties) {
	}

	@Override
	public void addClassComment(InnerClass innerClass, IntrospectedTable introspectedTable) {
	}

	@Override
	public void addEnumComment(InnerEnum innerEnum, IntrospectedTable introspectedTable) {
	}

	@Override
	public void addFieldComment(Field field, IntrospectedTable introspectedTable) {
	}

	@Override
	public void addModelClassComment(TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {

	}

	@Override
	public void addGeneralMethodComment(Method method, IntrospectedTable introspectedTable) {
	}

	@Override
	public void addClassComment(InnerClass innerClass, IntrospectedTable introspectedTable, boolean markAsDoNotDelete) {
	}
}
