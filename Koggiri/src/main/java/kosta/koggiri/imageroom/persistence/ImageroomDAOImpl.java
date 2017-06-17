package kosta.koggiri.imageroom.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.imageroom.domain.ImageroomDTO;
import kosta.koggiri.imageroom.domain.ImageroomVO;

@Repository
public class ImageroomDAOImpl implements ImageroomDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "kosta.koggiri.mapper.ImageroomMapper";

	@Override
	public List<ImageroomDTO> imageRoomList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".imageRoomList");
	}

	@Override
	public void imageRoomInsert(ImageroomVO imageRoom) {
		session.insert(namespace+".imageRoomInsert", imageRoom);
		
	}

	@Override
	public Integer nextRoomNoSelect() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".nextRoomNoSelect");
	}

	@Override
	public ImageroomDTO empSelect(String emp_id) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".empSelect", emp_id);
	}

	@Override
	public void imageRoomDelete(Integer room_id) {
		// TODO Auto-generated method stub
		session.delete(namespace + ".imageRoomDelete", room_id);
	}
	
	

}
