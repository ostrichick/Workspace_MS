package ezen.maru.pjt.service.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.ReviewDao;
import ezen.maru.pjt.vo.ReviewVo;

@Service("rv_insert")
public class ReviewInsertService implements ReviewService {
  private ReviewDao reviewDao;

  @Autowired(required = false)
  public ReviewInsertService(ReviewDao reviewDao) {
    this.reviewDao = reviewDao;
  }

  @Override
  public int writeReview(ReviewVo reviewVo) {
    return reviewDao.writeReview(reviewVo);
  }
}
