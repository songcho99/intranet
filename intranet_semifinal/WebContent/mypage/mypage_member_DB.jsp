<%@page import="intranet.dto.BoardDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="intranet.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="intranet.dao.BoardDao"%>
<%@page import="intranet.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String num=(String)session.getAttribute("num");
	String category = request.getParameter("category");
	String searchtxt = request.getParameter("searchtxt");
	String pageNum = request.getParameter("pageNum");
	
	BoardDao dao =new BoardDao();
	MemberDao mdao= new MemberDao();
	
	
	
	
	
	//페이지 영역
	   int perPage = 10; //한페이지당 보여질 방명록 수 : 3개
	   int perBlock = 5; //한 블럭당 보여질 페이지 수 : 5개
	   int totalCount; //총 글의 갯수
	   int currentPage; //현재페이지
	   int totalPage; // 총페이지수
	   int startPage;  // 각 블럭당 보여질 시작페이지
	   int endPage; //각블럭당 보여질 끝 페이지
	   
	   
	   int start; //각페이지당 보여질 시작 글번호(오라클은1부터, mysql은 0부터)
	   int end; // 각 페이지당 보여질 끝 글번호
		
	   try{
	   if(pageNum==null)
		   currentPage = 1;
	   else
		   currentPage = Integer.parseInt(pageNum);
	   
	   }catch(NumberFormatException e)
	   {
		   currentPage = 1;
	   }
	   //총 글의 개수 구하기
	   totalCount = mdao.memberlistCount(category,searchtxt);
	   System.out.println(totalCount);
	   totalPage = (totalCount/perPage)+(totalCount%perPage>0?1:0);
	   
	   if(currentPage > totalPage)
		   currentPage = totalPage;
	   
	   startPage = ((currentPage-1)/perBlock)*perBlock+1;
	   
	   endPage = (startPage+perBlock)-1;
	   
	   
	   if(endPage > totalPage)
		   endPage = totalPage;
	   
	   start = (currentPage-1)*perPage+1;
	   end = start+perPage-1;
	   
	   if(end>totalCount)
		   end = totalCount;
	
	
	
	
	
	
	
	List<MemberDto> list=mdao.memberlist(category,searchtxt,start,end);
	JSONArray array=new JSONArray();
	
	
	for(MemberDto mdto:list)
	{
		String hp=mdto.getHp1()+"-"+mdto.getHp2()+"-"+mdto.getHp3();
		int totalcount= dao.getBoardTotalCount(mdto.getNum());
		JSONObject ob=new JSONObject();
		ob.put("num", mdto.getNum());
		ob.put("id",mdto.getId());
		ob.put("buseo",mdto.getBuseo());
		ob.put("name",mdto.getName());
		ob.put("grade",mdto.getGrade());
		ob.put("birth",mdto.getBirth());
		ob.put("hp",hp);
		ob.put("ipsaday",mdto.getIpsaday().toString().substring(0, 10));
		ob.put("totalcount",totalcount);
		ob.put("image",mdto.getImage());
		ob.put("startPage",startPage);
		ob.put("endPage",endPage);
		ob.put("currentPage",currentPage);
		ob.put("totalPage",totalPage);
		ob.put("pageNum",pageNum);
		
		array.add(ob);
	}
%>
<%=array.toString()%>