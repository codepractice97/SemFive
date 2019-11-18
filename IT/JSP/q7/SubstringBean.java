package pkg;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.*;
import java.io.*;

public class SubstringBean extends SimpleTagSupport {
	
	private String input;
	private Integer start, end;

	public String getInput(){
		return input;
	}

	public Integer getStart(){
		return start;
	}

	public Integer getEnd(){
		return end;
	}

	public void setInput(String input){
		this.input = input;
	}
	
	public void setStart(Integer start){
		this.start = start;
	}

	public void setEnd(Integer end){
		this.end = end;
	}

	public void doTag() throws IOException {
		JspWriter out = getJspContext().getOut();
		if (input!=null) {
			out.println(input.substring(start,end));
		}
	}
}
