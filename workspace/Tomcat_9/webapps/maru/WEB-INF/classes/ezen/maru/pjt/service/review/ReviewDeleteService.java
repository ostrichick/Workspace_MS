package ezen.maru.pjt.service.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.ReviewDao;
import ezen.maru.pjt.vo.ReviewVo;

@Service("rv_delete")
public class ReviewDeleteService implements ReviewService {
  private ReviewDao reviewDao;

  @Autowired(required = false)
  public ReviewDeleteService(ReviewDao reviewDao) {
    this.reviewDao = reviewDao;
  }

  @Override
  public int removeReview(ReviewVo reviewVo) {
    return reviewDao.removeReview(reviewVo);
  }
}
