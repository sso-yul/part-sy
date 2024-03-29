package com.ottt.ottt.dao.review;

import java.util.List;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.CommentDTO;
import com.ottt.ottt.dto.ContentDirectorDTO;
import com.ottt.ottt.dto.ContentPosterDTO;
import com.ottt.ottt.dto.ContentTrailerDTO;
import com.ottt.ottt.dto.DirectorDTO;
import com.ottt.ottt.dto.EntertainerDTO;
import com.ottt.ottt.dto.ReportDTO;
import com.ottt.ottt.dto.ReviewDTO;
import com.ottt.ottt.dto.ReviewLikeDTO;

public interface ReviewDao {
	//리뷰 페이지
	int delete(Integer review_no, int user_no) throws Exception;			//삭제
	int update(ReviewDTO reviewDTO) throws Exception;						//수정
	int insert(ReviewDTO dto) throws Exception ;							//작성
	double ratingAvg(Integer content_no) throws Exception;
	int updateCommentCnt(Integer review_no, int cnt)throws Exception;
	int deleteCommentCnt(Integer review_no, int cnt)throws Exception;
	int reviewDuplication(Integer content_no, int user_no) throws Exception;
	int reviewReport(ReportDTO reportDTO) throws Exception;
	ReviewDTO selectReview(Integer content_no, Integer user_no)throws Exception;
	
	int count(int content_no) throws Exception;

	List<ReviewDTO> selectAll(int content_no) throws Exception;
//	List<CommentDTO> selectCommentsByBoard(??) throws Exception;
	
	int selectLikeCount(ReviewLikeDTO dto) throws Exception;
	
	int insertLike(ReviewLikeDTO dto) throws Exception;

	int deleteLike(ReviewLikeDTO dto) throws Exception;	
	
	List<ContentPosterDTO> selectPoster(int content_no) throws Exception;
	
	List<ContentTrailerDTO> selectTrailer(int content_no) throws Exception;
	
	DirectorDTO selectDirector(int content_no) throws Exception;
	
	List<EntertainerDTO> selectEntertainer(int content_no) throws Exception;
	
	//리플 페이지
	CommentDTO selectReply(Integer cmt_no) throws Exception;
	ReviewDTO replyReview(Integer content_no, Integer review_no);
	int replyCount(Integer review_no) throws Exception;
	List<CommentDTO> allreply(Integer review_no) throws Exception;
	int insertReply(CommentDTO commentDTO) throws Exception;
	int deleteReply(Integer cmt_no, int user_no)throws Exception;
	int deleteReplyReview(Integer review_no, int user_no) throws Exception;
	int updateReplyReview(ReviewDTO reviewDTO)throws Exception;
	int updateReply(CommentDTO CommentDTO) throws Exception;
	int replyReport(ReportDTO reportDTO) throws Exception;
	
	//나의 리뷰
	List<ReviewDTO> myReviewAll(SearchItem sc) throws Exception;
	int myReviewCnt(SearchItem sc) throws Exception;
	
	//좋아요 누른 리뷰
	List<ReviewDTO> likeReviewAll(SearchItem sc) throws Exception;
	int likeReviewCnt(SearchItem sc) throws Exception;
	
	//댓글 작성 리뷰
	List<ReviewDTO> cmtReviewAll(SearchItem sc) throws Exception;
	int cmtReviewCnt(SearchItem sc) throws Exception;
	
}
