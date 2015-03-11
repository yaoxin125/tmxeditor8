/**
 * TbxWriter.java
 *
 * Version information :
 *
 * Date:2013-7-1
 *
 * Copyright notice :
 * 本文件及其附带的相关文件包含机密信息，仅限瀚特盛科技有限公司指定的，与本项目有关的内部人员和客户联络人员查阅和使用。 
 * 如果您不是本保密声明中指定的收件者，请立即销毁本文件，禁止对本文件或根据本文件中的内容采取任何其他行动， 
 * 包括但不限于：泄露本文件中的信息、以任何方式制作本文件全部或部分内容之副本、将本文件或其相关副本提供给任何其他人。
 */
package net.heartsome.cat.te.core.converter.tbx;

import java.io.FileNotFoundException;

import net.heartsome.cat.common.bean.TmxTU;

/**
 * @author  yule
 * @version 
 * @since   JDK1.6
 */
public class TbxWriter extends AbstractWriter {

	/**
	 * @param filePath
	 * @throws FileNotFoundException
	 */
	public TbxWriter(String filePath) throws FileNotFoundException {
		super(filePath);
	
	}

	/** (non-Javadoc)
	 * @see net.heartsome.cat.te.core.converter.tbx.AbstractWriter#getHeaderXml()
	 */
	@Override
	protected String getHeaderXml(String srcLang) {
		// TODO Auto-generated method stub		
		String result ="<?xml version=\"1.0\" encoding=\"" + "UTF-8" + "\"?>\n"
		+"<martif type=\"TBX\" xml:lang=\"" + srcLang + "\">\n"
		+"<martifHeader>\n"
		+"<fileDesc>Generated by Heartsome Translation Studio TBX Exporter</fileDesc>\n"
		+"<encodingDesc><p type=\"DCSName\">tbxdefault.xcs</p></encodingDesc>\n"
	    +"</martifHeader>\n"
		+"<text>\n<body>\n";
		return result;
	}

	/** (non-Javadoc)
	 * @see net.heartsome.cat.te.core.converter.tbx.AbstractWriter#getEndXml()
	 */
	@Override
	protected String getEndXml() {
		// TODO Auto-generated method stub
		String result = "</body>\n</text>\n</martif>\n";
		return result;
	}

	/** (non-Javadoc)
	 * @see net.heartsome.cat.te.core.converter.tbx.AbstractWriter#writeTmxTU(net.heartsome.cat.common.bean.TmxTU)
	 */
	@Override
	protected void writeTmxTU(TmxTU tu) {
		// TODO Auto-generated method stub
		writeXmlString(Model2String.TmxTu2TbxXMLString(tu,true));
	}

	/** (non-Javadoc)
	 * @see net.heartsome.cat.te.core.converter.tbx.AbstractWriter#getWriterEnconding()
	 */
	@Override
	protected String getWriterEnconding() {
		// TODO Auto-generated method stub
		return "utf-8";
	}


	
}
