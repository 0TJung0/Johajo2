package spring.data;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDao  extends SqlSessionDaoSupport{

	public int QnaTotalCount(int idx) {

		return getSqlSession().selectOne("QnaTotalCount",idx);
	}

	public List<QnaDto> QnaSelectList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("QnaSelectList",map);
	}

	public void myQnaInsert(QnaDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("QnaDataInsert",dto);
	}

	public int qnaMaxIdx() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("QnaMaxNum");
	}
	
	public void myqnaDelete(int idx) {
		// TODO Auto-generated method stub
		getSqlSession().delete("QnaDataDelete",idx);
	}

	//답변 등록하기 
	public void myanswerInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		getSqlSession().update("answerInsert",map);
	}
	
	//답변 삭제하기
	public void myanwDelete(int idx) {
		// TODO Auto-generated method stub
		getSqlSession().update("answerDelete",idx);
	}

	public QnaDto myansSelect(int idx) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("answerSelect",idx);
	}


}
