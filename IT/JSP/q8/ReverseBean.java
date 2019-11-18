package pkg;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.*;
import java.io.*;

public class ReverseBean extends SimpleTagSupport {
	
	private String input;
	
	public String getInput(){
		return input;
	}

	public void setInput(String input){
		this.input = input;
	}

	public void doTag() throws IOException {
		JspWriter out = getJspContext().getOut();
		if (input!=null){
			String revStr = "";
			for (int i = input.length() - 1; i >= 0; i--)
				revStr += input.charAt(i);
			out.println(revStr);
		}
	}
}
