/**
 * GoogleTransUtils.java
 *
 * Version information :
 *
 * Date:2012-5-13
 *
 * Copyright notice :
 * 本文件及其附带的相关文件包含机密信息，仅限瀚特盛科技有限公司指定的，与本项目有关的内部人员和客户联络人员查阅和使用。 
 * 如果您不是本保密声明中指定的收件者，请立即销毁本文件，禁止对本文件或根据本文件中的内容采取任何其他行动， 
 * 包括但不限于：泄露本文件中的信息、以任何方式制作本文件全部或部分内容之副本、将本文件或其相关副本提供给任何其他人。
 */
package net.heartsome.cat.ts.bingtrans;

import com.memetix.mst.language.Language;

/**
 * @author jason
 * @version
 * @since JDK1.6
 */
public class BingTransUtils {

	/** 处理语言 */
	public static Language processLanguage(String hsLanguageCode) {
		// 由于中文前缀一样，需针对中文特殊处理。
		if (hsLanguageCode.equalsIgnoreCase("zh-CN")) {
			return Language.CHINESE_SIMPLIFIED;
		}

		if (hsLanguageCode.equalsIgnoreCase("zh-TW") || hsLanguageCode.equalsIgnoreCase("zh-HK")) {
			return Language.CHINESE_TRADITIONAL;
		}
		
		Language[] supportedLangs = Language.values();
		for (Language lang : supportedLangs) {
			String code = lang.toString();
			if (code.equals("")) {
				continue;
			}

			if (hsLanguageCode.startsWith(code) || code.startsWith(hsLanguageCode)) {
				return lang;
			}
		}
		return null;
	}
}
