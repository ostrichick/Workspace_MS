package ezen.maru.pjt.service.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.ReviewDao;
import ezen.maru.pjt.vo.ReviewVo;

@Service("rv_list")
public class ReviewListService implements ReviewService {
  private ReviewDao reviewDao;

  @Autowired(required = false)
  public ReviewListService(ReviewDao reviewDao) {
    this.reviewDao = reviewDao;
  }

  @Override
  public List<ReviewVo> getReviewList(int product_idx) {
    return reviewDao.getReviewList(product_idx);
  }

  @Override
  public List<ReviewVo> getReviewListMember(int member_idx) {
    return reviewDao.getReviewListMember(member_idx);
  }

}
