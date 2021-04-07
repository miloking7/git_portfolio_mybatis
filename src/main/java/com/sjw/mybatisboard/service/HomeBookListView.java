package com.sjw.mybatisboard.service;

import java.util.List;

import com.sjw.mybatisboard.dto.HomeBook;


	public class HomeBookListView {
		private int messageTotalCount;
		private int currentPageNumber;
		private List<HomeBook> messageList;
		private int pageTotalCount;
		private int messageCountPerPage;
		private int firstRow;
		private int endRow;

		public HomeBookListView(List<HomeBook> messageList, int messageTotalCount, int currentPageNumber,
				int messageCountPerPage, int startRow, int endRow) {

			this.messageList = messageList;
			this.messageTotalCount = messageTotalCount;
			this.currentPageNumber = currentPageNumber;
			this.messageCountPerPage = messageCountPerPage;
			this.firstRow = startRow;
			this.endRow = endRow;
			calculatePageTotalCount();
		}

		private void calculatePageTotalCount() {
			if(messageTotalCount == 0 ){
				pageTotalCount =0;
			}else{
				pageTotalCount = messageTotalCount / messageCountPerPage;
				if(messageTotalCount % messageCountPerPage>0){
					pageTotalCount++;
				}
			}
		}

		public int getMessageTotalCount() {
			return messageTotalCount;
		}

		public int getCurrentPageNumber() {
			return currentPageNumber;
		}

		public List<HomeBook> getMessageList() {
			return messageList;
		}

		public int getPageTotalCount() {
			return pageTotalCount;
		}

		public int getMessageCountPerPage() {
			return messageCountPerPage;
		}

		public int getFirstRow() {
			return firstRow;
		}

		public int getEndRow() {
			return endRow;
		}

		public boolean isEmpty(){
			return messageTotalCount==0;
		}
	}
	
