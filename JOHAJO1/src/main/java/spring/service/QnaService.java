package spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.QnaDao;
import spring.data.QnaDto;

@Service
public class QnaService {
	@Autowired
	private QnaDao dao;
	
	public int QnaTotalCount(int idx) {
		// TODO Auto-generated method stub
		return dao.QnaTotalCount(idx);
	}

	public List<QnaDto> QnaSelectList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return dao.QnaSelectList(map);
	}

	public void myqnaInsert(QnaDto dto) {
		// TODO Auto-generated method stub
		dao.myQnaInsert(dto);
	}

	public int qnaMaxIdx() {
		// TODO Auto-generated method stub
		return dao.qnaMaxIdx();
	}
	
	public void myqnaDelete(int idx) {
		// TODO Auto-generated method stub
		dao.myqnaDelete(idx);
	}

	public void myanswerInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		dao.myanswerInsert(map);
	}

	public void myanwDelete(int idx) {
		// TODO Auto-generated method stub
		dao.myanwDelete(idx);
	}

	public QnaDto myanwSelect(int idx) {
		// TODO Auto-generated method stub
		return dao.myansSelect(idx);
	}

}
