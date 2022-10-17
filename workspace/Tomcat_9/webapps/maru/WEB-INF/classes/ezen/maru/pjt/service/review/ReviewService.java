package ezen.maru.pjt.service.review;

import java.util.List;

import ezen.maru.pjt.vo.ReviewVo;

public interface ReviewService {

  default List<ReviewVo> getReviewList(int product_idx) {
    return null;
  }

  default int writeReview(ReviewVo reviewVo) {
    return 0;
  }

  default int editReview(ReviewVo reviewVo) {
    return 0;
  }

  default int removeReview(ReviewVo reviewVo) {
    return 0;
  }

  default List<ReviewVo> getAnswerList(ReviewVo reviewVo) {
    return null;
  }

  default int writeAnswer(ReviewVo reviewVo) {
    return 0;
  }

  default List<ReviewVo> getReviewListMember(int member_idx) {
    return null;
  }

}
