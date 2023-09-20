package ezen.maru.pjt.service.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.AdminDao;

@Service("admin_list")
public class AdminListService implements AdminService {
  private AdminDao adminDao;

  @Autowired(required = false)
  public AdminListService(AdminDao adminDao) {
    this.adminDao = adminDao;
  }

  @Override
  public Map<String, String> getStats() {
    return adminDao.getStats();
  }

}
