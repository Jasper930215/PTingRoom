package noom.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import noom.board.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService
{
	
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public List<Map<String,Object>> selectBoardList(Map<String,Object> map, int start, int end, String searchType, String searchWord) throws Exception
	{
		return boardDAO.selectBoardList(map, start, end, searchType, searchWord);
	}
	
	@Override 
	public void insertBoard(Map<String, Object> map) throws Exception 
	{ 
		boardDAO.insertBoard(map); 
	}

	@Override 
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception 
	{ 
		boardDAO.updateHitCnt(map); 
		Map<String, Object> resultMap = boardDAO.selectBoardDetail(map); 
		return resultMap; 
	}
	
	@Override 
	public Map<String, Object> selectBoardDetailAdd(Map<String, Object> map) throws Exception 
	{ 
		
		Map<String, Object> resultMap = boardDAO.selectBoardDetailAdd(map); 
		return resultMap; 
	}

	@Override public void updateBoard(Map<String, Object> map) throws Exception
	{ 
		boardDAO.updateBoard(map); 
	}

	@Override 
	public void deleteBoard(Map<String, Object> map) throws Exception 
	{ 
		boardDAO.deleteBoard(map); 
	}

	@Override 
	public int boardListGetCount(String searchType, String searchWord) throws Exception 
	{ 
		return boardDAO.boardListGetCount(searchType, searchWord); 
	}
	
	
}
