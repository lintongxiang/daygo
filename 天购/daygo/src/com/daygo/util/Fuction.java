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
		
		String question="��������ѵ����գ�";
		if(problem.equals("friend_birthday"))
		{
			question="��������ѵ����գ�";
		}
		else
		{
			if(problem.equals("old_address"))
			{
				question="�Ҷ�ʱ��ס�صĵ�ַ��";
			}
			else
			{
				if(problem.equals("motto"))
				{
					question="�ҵ��������ǣ�";
				}
				else
				{
					if(problem.equals("favorite_movie"))
					{
						question="����ϲ���ĵ�Ӱ��";
					}
					else
					{
						if(problem.equals("favorite_song"))
						{
							question="����ϲ���ĸ�����";
						}
						else
						{
							if(problem.equals("favorite_food"))
							{
								question="����ϲ����ʳ�";
							}
							else
							{
								if(problem.equals("interest"))
								{
									question="�����İ��ã�";
								}
								else
								{
									if(problem.equals("favorite_novel"))
									{
									question="����ϲ����С˵��";	
									}
									else
									{
										if(problem.equals("favorite_equipe"))
										{
										question="����ϲ�����˶��ӣ�";	
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
