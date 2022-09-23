package com.spring.jj9.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.purchase.mapper.PurchaseMapper;

@Service
public class PurchaseServiceImpl implements PurchaseService{
	
	@Autowired
	PurchaseMapper mapper;

	@Override
	public List<TalentAll> getList(int id) {
		return mapper.get(id);
	}

	@Override
	public List<TalentAll> getReviewList(int id) {
		return mapper.getreview(id);
	}

	@Override
    public double getSumReviewGrade(int id) {
        List<TalentAll>reviewsum =  mapper.getgardelist(id);
        int sum = 0;
        int i = 0;
        double avg = 0.0;
        if(reviewsum.size() == 0) {
            return avg;
        }else

        for(TalentAll grade : reviewsum) {
            sum += grade.getReview_grade();
            i++;
        }
         avg = (double)(sum/i);

        return avg;
    }

	@Override
	public int getCountGrade(int id) {
		List<TalentAll>reviewsum =  mapper.getgardelist(id);
		int count = 0;
		for(TalentAll grade : reviewsum) {
			count++;
		}

		return count;
	}

}
