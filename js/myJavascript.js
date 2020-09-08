$(document).ready(function(){
	$(".alert").delay(5000).slideUp(); 

	$('.view_news').click(function(){
		var id_news = $(this).attr('id_views');


		/* $.get("news/"+id_news+"/", {id_news : id_news}, function(data){

		 	$('#content_news').html(data);

		}); */

		$.ajax({
			url: 'backend/news/'+id_news+'/',
			type: 'GET',
			dataType: 'html',
			data: {id_news: id_news},
		})
		.done(function(data) {
			$('#content_news').html(data);
		})
		.fail(function() {
			console.log("error");
		});

	});


})

// Funny
document.getElementById('funny').onclick = function(){
	swal({
		title: "Thông báo",
		text: "Chào bạn, bạn có xác nhận xóa học viên này không?",
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: '#DD6B55',
		confirmButtonText: 'OK',
		cancelButtonText: "Cancel",
		closeOnConfirm: false,
		closeOnCancel: false
	},
	function(isConfirm){
	    if (isConfirm){
			swal({
				title: "Thông báo lại",
				text: "Bạn nghĩ quyết định xóa của bạn có đúng hay không?",
				imageUrl: 'https://cdn.pixabay.com/photo/2014/04/02/10/26/attention-303861_960_720.png',
				showCancelButton: true,
				confirmButtonColor: '#DD6B55',
				confirmButtonText: 'OK',
				cancelButtonText: "Cancel",
				closeOnConfirm: false,
				closeOnCancel: false
			}, function(isConfirm){
				if (isConfirm) {
					swal({
						title: "Hỏi lại",
						text: "Bạn chắc chắn chưa?",
						imageUrl: 'https://www.chamdenuocmo.com/wp-content/uploads/2018/10/icon-funny.png',
						showCancelButton: true,
						confirmButtonColor: '#DD6B55',
						confirmButtonText: 'OK',
						cancelButtonText: "Cancel",
						closeOnConfirm: false,
						closeOnCancel: false
					}, function(isConfirm){
						if (isConfirm) {
							swal({
								title: "Hỏi lại",
								text: "Thật sự đây là quyết định của bạn chứ?",
								imageUrl: 'https://cdn4.iconfinder.com/data/icons/smileys-for-fun/128/smiley__10-512.png',
								showCancelButton: true,
								confirmButtonColor: '#DD6B55',
								confirmButtonText: 'OK',
								cancelButtonText: "Cancel",
								closeOnConfirm: false,
								closeOnCancel: false
							}, function(isConfirm){
								if (isConfirm) {
									swal({
										title: "Hỏi lại",
										text: "Bạn đã tham khảo ý kiến của người khác khi xóa dữ liệu này chưa?",
										imageUrl: 'https://icons.iconarchive.com/icons/custom-icon-design/flatastic-4/512/Users-icon.png',
										showCancelButton: true,
										confirmButtonColor: '#DD6B55',
										confirmButtonText: 'OK',
										cancelButtonText: "Cancel",
										closeOnConfirm: false,
										closeOnCancel: false
									}, function(isConfirm){
										if (isConfirm) {
											swal({
												title: "Hỏi lại",
												text: "Bạn chịu trách nhiệm về việc này chứ?",
												imageUrl: 'https://cdn.pixabay.com/photo/2012/04/01/18/58/danger-24045_960_720.png',
												showCancelButton: true,
												confirmButtonColor: '#DD6B55',
												confirmButtonText: 'OK',
												cancelButtonText: "Cancel",
												closeOnConfirm: false,
												closeOnCancel: false
											}, function(isConfirm){
												if (isConfirm) {
													swal({
														title: "Hỏi lại",
														text: "Dữ liệu đã xóa được 50%, bạn có muốn xóa nữa không?",
														imageUrl: 'https://cdn.pixabay.com/photo/2012/04/12/22/36/danger-30964_960_720.png',
														showCancelButton: true,
														confirmButtonColor: '#DD6B55',
														confirmButtonText: 'OK',
														cancelButtonText: "Cancel",
														closeOnConfirm: false,
														closeOnCancel: false
													}, function(isConfirm){
														if (isConfirm) {
															swal({
																title: "Hỏi lại",
																text: "Bạn quyết định xóa 50% còn lại chứ?",
																imageUrl: 'https://pluspng.com/img-png/too-funny-png-you-re-so-funny-emoticon-256.png',
																showCancelButton: true,
																confirmButtonColor: '#DD6B55',
																confirmButtonText: 'OK',
																cancelButtonText: "Cancel",
																closeOnConfirm: false,
																closeOnCancel: false
															}, function(isConfirm){
																if (isConfirm) {
																	swal({
																		title: "Hỏi lại",
																		text: "Dữ liệu đã xóa, bạn muốn khôi phục không?",
																		imageUrl: 'https://img.favpng.com/0/12/13/ui-icon-notification-icon-bell-icon-png-favpng-QWnWDcspXKXsD0ABPv7kpTqdP.jpg',
																		showCancelButton: true,
																		confirmButtonColor: '#DD6B55',
																		confirmButtonText: 'OK',
																		cancelButtonText: "Cancel",
																		closeOnConfirm: false,
																		closeOnCancel: false
																	},function(isConfirm){
																		if (isConfirm) {
																			swal({
																				title: "Đùa chứ :))",
																				text: "Bạn nhây thế nhở :))",
																				type: "warning",
																				showCancelButton: true,
																				confirmButtonColor: '#DD6B55',
																				confirmButtonText: 'OK',
																				cancelButtonText: "Cancel",
																				closeOnConfirm: false,
																				closeOnCancel: false
																			}, function(isConfirm){
																				if (isConfirm) {
																					swal({
																						title: "Bạn nhây cực kỳ ý :))",
																						text: "Xem xong video nhớ LIKE nhá bạn êi",
																						imageUrl: 'https://i.dlpng.com/static/png/388800_preview.png',
																						showCancelButton: true,
																						confirmButtonColor: '#DD6B55',
																						confirmButtonText: 'OK',
																						cancelButtonText: "Cancel",
																						closeOnConfirm: false,
																						closeOnCancel: false
																					})
																				}else{
																					swal("Bạn nhây thể nhở :))", "ahihi...");
																				}
																			})
																		}else{
																			swal({
																				title: "Cancel? Dữ liệu lại được khôi phục rồi :))",
																				text: "Xem xong video nhớ LIKE nhá bạn êi",
																				imageUrl: "https://i.dlpng.com/static/png/388800_preview.png",
																				showCancelButton: true,
																				confirmButtonColor: '#DD6B55',
																				confirmButtonText: 'LIKE',
																				cancelButtonText: "LOVE",
																				closeOnConfirm: false,
																				closeOnCancel: false
																			})
																		}
																	})
																}else{
																	swal("Bạn nhây thể nhở :))", "ahihi...");
																}
															})
														}else{
															swal("Bạn nhây thể nhở :))", "ahihi...");
														}
													})
												}else{
													swal("Bạn nhây thể nhở :))", "ahihi...");
												}
											})
										}else {
											swal("Bạn nhây thể nhở :))", "ahihi...");
										}
									})
								}else{
									swal("Bạn nhây thể nhở :))", "ahihi...");
								}
							})
						}else{
							swal("Bạn nhây thể nhở :))", "ahihi...");
						}
					})
				}else{
					swal("Bạn nhây thể nhở :))", "ahihi...");
				}
			});
	    }else{
	      swal("Bạn nhây thể nhở :))", "ahihi...");
	    }
	});
};
