package kosta.koggiri.imageroom.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.imageroom.domain.ChatingDTO;
import kosta.koggiri.imageroom.domain.ImageRoomHisVO;


@Repository
public class ChatDAOImpl implements ChatDAO{
	private static final String NAMESPACE = "kosta.koggiri.mapper.ChatMapper";
	
	@Inject
	private SqlSession session;

	@Override
	public void imageRoomHisInsert(ImageRoomHisVO vo) {
		session.insert(NAMESPACE + ".imageRoomHisInsert", vo);
	}

	@Override
	public List<ImageRoomHisVO> imageRoomHisList(Integer room_id) {
		return session.selectList(NAMESPACE + ".imageRoomHisList", room_id);
	}

	@Override
	public Integer nextImageRoomHisNoSelect() {
		return session.selectOne(NAMESPACE + ".nextImageRoomHisNoSelect");
	}

	@Override
	public List<ChatingDTO> chaingList(Integer room_id) {
		return session.selectList(NAMESPACE + ".chaingList", room_id);
	}

	@Override
	public void imageRoomHisDelete(Integer room_id) {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE+".imageRoomHisDelete", room_id);
	}
	
}
