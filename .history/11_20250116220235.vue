<script setup>
	import {
		ref,
		onMounted
	} from 'vue';
	import {
		onLoad,
		onShareAppMessage
	} from '@dcloudio/uni-app';
	import {
		Get_DetailBook,
		Collect_Book,
		UNCOLLECT_BOOK,
		GET_USER_COLLECT_BOOK,
		Insert_BrowseHistory,
		AddBook_Comment,
		DeleteBook_Comment
	} from '@/api'
	let isExpanded_book = ref(false);
	let isExpanded_author = ref(false);
	let isLoggedIn = ref(false);
	let book = ref({});
	let text_book = ref("")
	let text_author = ref("")
	let book1 = (uni.getStorageSync('NowBook'));
	let user = {};
	if (uni.getStorageSync('userInfo')) {
		isLoggedIn.value = true;
		user = JSON.parse(uni.getStorageSync('userInfo'));
	} else {
		isLoggedIn.value = false;
		user = {};
	}

	let isFavorited = ref(false);


	//点击跳转到图鉴
	function to_Illustrated() {
		uni.setStorageSync('NowIllustrated', book1);
		uni.navigateTo({
			url: `/pages/Illustrated_detail/Illustrated_detail?id=${book1.Book_ID}`
		});
	}

	//发送获取书籍详情的请求
	async function fetchBookDetails(bookId) {
		try {
			const response = await uni.request({
				url: Get_DetailBook,
				method: 'POST',
				data: {
					bookId
				}
			});
			book.value = response.data.data;
			text_book.value = response.data.data.Book_Introduce.slice(0, 90)
			text_author.value = response.data.data.Author_Introduction.slice(0, 60)
			console.log(response.data.data);
		} catch (error) {
			console.error('Error fetching book details:', error);
		}
	}
	//发送获取书籍收藏的请求
	async function fetchBookCollect() {
		try {
			const response = await uni.request({
				url: Collect_Book,
				method: 'POST',
				data: {
					User_Name: user.username,
					Book_ID: book1.Book_ID,
					Book_Name: book1.Book_Name,
					Collect_Time: gettime(),
					Img_Url: book1.Img_Url
				}
			});
		} catch (error) {
			console.error('Error fetching book collect:', error);
		}
	}

	//发送取消收藏的请求
	async function fetchBookCancelCollect() {
		try {
			const response = await uni.request({
				url: UNCOLLECT_BOOK,
				method: 'POST',
				data: {
					User_Name: user.username,
					Book_ID: book1.Book_ID,
					Book_Name: book1.Book_Name,
					Collect_Time: new Date()
				}
			});
		} catch (error) {
			console.error('Error fetching book collect:', error);
		}
	}

	//获取所有书籍
	async function getAllBookCollect() {
		try {
			const response = await uni.request({
				url: GET_USER_COLLECT_BOOK,
				method: 'POST',
				data: {
					User_Name: user.username,
				}
			});
			isFavorited.value = response.data.some((item) => item.Book_ID == book1.Book_ID);
		} catch (error) {
			console.error('Error fetching book collect:', error);
		}
	}

	//提示还未登录
	function toggleFavorite() {
		if (!isLoggedIn.value) {
			uni.showModal({
				title: '提示',
				content: '您尚未登录，是否前往登录页面？',
				showCancel: true,
				cancelText: '取消',
				confirmText: '确定',
				success: function(res) {
					if (res.confirm) {
						uni.reLaunch({
							url: '/pages/login/login'
						});
					}
				}
			});
			return;
		}

		if (!isFavorited.value) {
			fetchBookCollect();
		} else {
			fetchBookCancelCollect();
		}

		isFavorited.value = !isFavorited.value;
	}

	//书籍浏览的请求
	async function BookBrowse() {
		try {
			const response = await uni.request({
				url: Insert_BrowseHistory,
				method: 'POST',
				data: {
					User_Name: user.username,
					Book_ID: book1.Book_ID,
					Book_Name: book1.Book_Name,
					Browse_Time: gettime(),
					Img_Url: book1.Img_Url
				}
			});
		} catch (error) {
			console.error('Error fetching book collect:', error);
		}
	}

	let goBack = () => {
		uni.navigateBack();
	};

	//获取当前时间
	let gettime = () => {
		let date = new Date();
		let year = date.getFullYear();
		let month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
		let day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
		let hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
		let minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
		let seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
		return year + "年" + month + "月" + day + "日" + hours + ":" + minutes + ":" + seconds;
	}

	//分享功能
	onShareAppMessage((res) => {
		let shareObj = {
			title: book.value.Book_Name,
			path: `/pages/detail/detail?id=${JSON.stringify(book.value.Book_Id)}`,
			imageUrl: book.value.Img_Url,
			success: function(res) {
				if (res.errMsg === 'shareAppMessage:ok') {
					console.log('分享成功');
				}
			},
			fail: function(res) {
				if (res.errMsg === 'shareAppMessage:fail cancel') {
					console.log('用户取消分享');
				} else if (res.errMsg === 'shareAppMessage:fail') {
					console.error('分享失败:', res.errMsg);
				}
			},
			complete: function() {
				console.log('分享结束');
			}
		};

		if (res.from === 'button') {
			const eData = res.target.dataset;
			console.log(eData.name);
			shareObj.path = `/pages/btnname/btnname?btn_name=${eData.name}`;
		}

		return shareObj;
	});

	// 新增的评论内容
	let newComment = ref({
		Content: '',
		Comment_User_NickName: user.nickname || '匿名用户',
		Comment_Time: ''
	});

	// 提交评论的方法
	async function submitComment() {
		if (!isLoggedIn.value) {
			uni.showModal({
				title: '提示',
				content: '您尚未登录，是否前往登录页面？',
				showCancel: true,
				cancelText: '取消',
				confirmText: '确定',
				success: function(res) {
					if (res.confirm) {
						uni.reLaunch({
							url: '/pages/login/login'
						});
					}
				}
			});
			return;
		}
		if (newComment.value.Content == '') {
			uni.showToast({
				title: '不能为空',
				icon: 'error',
				duration: 2000
			});
		}

		// 设置评论时间
		newComment.value.Comment_Time = gettime();

		try {
			const response = await uni.request({
				url: AddBook_Comment,
				method: 'POST',
				data: {
					Comment_User_Name: user.username,
					Comment_User_NickName: newComment.value.Comment_User_NickName,
					Book_ID: book1.Book_ID,
					Book_Name: book1.Book_Name,
					Comment_Content: newComment.value.Content,
					Comment_Time: newComment.value.Comment_Time
				}
			});

			// 成功后清空输入框并刷新评论列表
			newComment.value.Content = '';
			fetchBookDetails(book1.Book_ID); // 或者直接更新book对象中的评论数据
			console.log(response);
			if (response.statusCode == 200) {
				uni.showToast({
					title: '评论成功',
					icon: 'success',
					duration: 2000
				});
			}
		} catch (error) {
			console.error('Error submitting comment:', error);
			uni.showToast({
				title: '评论失败，请重试',
				icon: 'none',
				duration: 2000
			});
		}
	}

	//删除评论
	function deleteCommentStart(Book_Comment_ID) {
		uni.showModal({
			title: '提示',
			content: '您确定要删除吗？',
			showCancel: true,
			cancelText: '取消',
			confirmText: '确定',
			success: function(res) {
				if (res.confirm) {
					deleteComment(Book_Comment_ID)
				}
			}
		});
	}
	//删除评论
	async function deleteComment(Book_Comment_ID) {

		console.log(Book_Comment_ID);
		try {
			const response = await uni.request({
				url: DeleteBook_Comment,
				method: 'POST',
				data: {
					Comment_User_Name: user.username,
					Book_Comment_ID: Book_Comment_ID
				}
			})
			if (response.statusCode == 200) {
				uni.showToast({
					title: '删除成功',
					icon: 'success',
					duration: 2000
				});
			}
			fetchBookDetails(book1.Book_ID);
		} catch (error) {
			//TODO handle the exception
		}
	}


	//拿到其他页面传过来的书籍ID
	onLoad((options) => {
		const id = JSON.parse(options.id);
		getAllBookCollect();
		fetchBookDetails(id);
		BookBrowse();
	});
</script>