package edu.fjnu.book.service;

import java.io.Serializable;
import java.util.List;

import edu.fjnu.book.domain.Mark;

public interface MarkService {
	public List<Mark> find(Mark mark);
	public Mark get(Serializable id);
	public void insert(Mark mark);
	public void update(Mark mark);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
}
