package pkg;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.*;
import java.io.*;

public class ChocoBean extends SimpleTagSupport{

	private String name,texture;

	public String getTexture() {
		return texture;
	}

	public void setTexture(String texture) {
		this.texture = texture;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void doTag() throws IOException{
		JspWriter out=getJspContext().getOut();
		if(name!=null){
			out.print("Hello "+name+"! ");
		}
		if(texture!=null)	{
			if(texture.equals("Chewy"))
				out.println("Five Star and Bar One");
			else if(texture.equals("Crunchy"))
				out.println("Munch and KitKat");
			else
				out.println("Texture value invalid!");
		}
	}
}
