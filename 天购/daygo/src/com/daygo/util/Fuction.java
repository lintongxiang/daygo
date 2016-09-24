package com.daygo.util;

import java.util.regex.Pattern;

public class Fuction {

	private String stdmail="^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$";
	private String stdtel="\\d{11}";
	public boolean chackmail(String mail)
	{
		boolean flag=false;
		flag=mail.matches(stdmail);
		return flag;
	}
	public boolean chacktel(String tel)
	{
		return tel.matches(stdtel);
	}
	public String chackproblem(String problem)
	{
		
		String question="我最好朋友的生日？";
		if(problem.equals("friend_birthday"))
		{
			question="我最好朋友的生日？";
		}
		else
		{
			if(problem.equals("old_address"))
			{
				question="我儿时居住地的地址？";
			}
			else
			{
				if(problem.equals("motto"))
				{
					question="我的座右铭是？";
				}
				else
				{
					if(problem.equals("favorite_movie"))
					{
						question="我最喜爱的电影？";
					}
					else
					{
						if(problem.equals("favorite_song"))
						{
							question="我最喜爱的歌曲？";
						}
						else
						{
							if(problem.equals("favorite_food"))
							{
								question="我最喜爱的食物？";
							}
							else
							{
								if(problem.equals("interest"))
								{
									question="我最大的爱好？";
								}
								else
								{
									if(problem.equals("favorite_novel"))
									{
									question="我最喜欢的小说？";	
									}
									else
									{
										if(problem.equals("favorite_equipe"))
										{
										question="我最喜欢的运动队？";	
										}
									}
								}
							}
						}
					}
				}
			}
		}
		return question;
	}

}
