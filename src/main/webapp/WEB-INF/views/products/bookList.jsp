<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서목록</title>


</head>

<body>
    <div class="container">
        <div id="app">
            <v-app>

                <div class="input-group mb-3">
                    <div class="form-group input-group-prepend">
                        <select class="form-control">
                            <option>제목</option>
                            <option>내용</option>
                            <option>저자</option>
                            <option>출판사</option>
                        </select>
                    </div>
                    <input type="text" class="form-control" placeholder="Search">
                    <div class="input-group-append">
                        <button class="btn btn-success form-control" type="submit">Go</button>
                    </div>
                </div>



                <p>총 {{count}}건</p>
                <p><a href="#" @click.prevent="changeRows">10개씩 보기</a></p>

                <table class="table table-hover">
                    <tr v-for="post in posts" :key="post.bookUid">
                        <td style="display: none;">{{post.bookUid}}</td>
                        <td style="height: 200px; width: 24.99%;">
                            <img class="img-thumbnail mx-auto d-block" v-if="post.serName" :src="post.serName"
                                style="max-height: 100%;">
                        </td>
                        <td style="width: 50%;">
                            <p>[{{post.categoryName}}] <a href="#" @click="viewItem" data-toggle="modal"
                                    data-target="#viewModal">{{post.subject}}</a></p>
                            <p>{{post.author}} / {{post.pubName}}</p>
                            <p>{{post.price}}</p>
                        </td>
                        <td style="width: 24.99%;"><a @click.prevent="deleteItem">삭제</a></td>
                    </tr>
                </table>
                <div class="row">
                    <div class="col-10"></div>
                    <div class="col-2">
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">등록</button>
                    </div>

                </div>

                <ul class="pagination justify-content-center" style="margin:20px 0">
                    <li class="page-item" :class="{disabled : startPage == 1}"><a class="page-link" href="#"
                            @click.prevent="prevPage">Previous</a></li>
                    <li class="page-item" v-for="(n, index) in writePages"
                        :class="{active : page == n + startPage - 1, disabled : n + startPage - 1 > endPage}">
                        <a class="page-link" href="#" @click.prevent="curPage">{{n + startPage - 1}}</a>
                    </li>
                    <li class="page-item" :class="{disabled : startPage > endPage - writePages}"><a class="page-link"
                            href="#" @click.prevent="nextPage">Next</a></li>
                </ul>

                <!-- The Modal -->
                <div class="modal" id="myModal">
                    <div class="modal-dialog modal-lg">
                        <form @submit.prevent="submitForm">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">도서등록</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->

                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="card" style="height: 200px;" @dragover.prevent
                                                @dragenter.prevent @drop.prevent="onDrop">
                                                <img class="img-thumbnail mx-auto d-block" v-if="url" :src="url"
                                                    style="max-height: 100%;">
                                                <div class="card-body">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="subject">제목</label>
                                                <input :value="subject" @input="subject=$event.target.value"
                                                    class="form-control">
                                            </div>

                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="author">저자</label>
                                                <input :value="author" @input="author=$event.target.value"
                                                    class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <input type="file" @change="onFileChange" accept="image/*"
                                                ref="myFileInput">
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="price">정가</label>
                                                <input v-model.number.trim="price" @input="maxLengthCheck"
                                                    class="form-control" type="number">
                                            </div>
                                        </div>

                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-4">

                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="categoryUid">카테고리</label>
                                                <v-autocomplete v-model="categoryUid" :items="categories" 
                                                    :item-text="item => item.rootName + '/' + item.down1Name + '/' + item.down2Name"
                                                    :debounce-search="0" item-value="down2Uid"
                                                    clearable>
                                                    
                                                </v-autocomplete>

                                            </div>

                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="pubUid">출판사</label>
                                                <input v-model.number.trim="pubUid" class="form-control" list="pubList">
                                                <datalist id="pubList">
                                                    <option value="1"></option>
                                                    <option value="2"></option>
                                                    <option value="3"></option>
                                                    <option value="4"></option>
                                                </datalist>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-4">
                                            <p>내용</p>
                                        </div>
                                        <div class="col-8">
                                            <div class="form-group">
                                                <textarea :value="content" @input="content=$event.target.value"
                                                    class="form-control"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                                    <button type="button" @click="clearForm" class="btn btn-primary">초기화</button>
                                    <button type="submit" class="btn btn-primary">등록</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>

                <!-- The ViewModal -->
                <div class="modal" id="viewModal">
                    <div class="modal-dialog modal-lg">
                        <form @submit.prevent="submitForm">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">도서정보</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->

                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="card" style="height: 200px;" @dragover.prevent
                                                @dragenter.prevent @drop.prevent="onDrop">
                                                <img class="img-thumbnail mx-auto d-block" v-if="url" :src="url"
                                                    style="max-height: 100%;">
                                                <div class="card-body">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="subject">제목</label>
                                                <input :value="subject" @input="subject=$event.target.value"
                                                    class="form-control" :readonly="!isEditable">
                                            </div>

                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="author">저자</label>
                                                <input :value="author" @input="author=$event.target.value"
                                                    class="form-control" :readonly="!isEditable">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <input type="file" @change="onFileChange" accept="image/*" ref="myFileInput"
                                                :disabled="!isEditable">
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="price">정가</label>
                                                <input v-model.number.trim="price" @input="maxLengthCheck"
                                                    class="form-control" type="number" :readonly="!isEditable">
                                            </div>
                                        </div>

                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-4">

                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="categoryUid">카테고리</label>
                                                <select v-model="categoryUid" class="form-control"
                                                    :disabled="!isEditable">
                                                    <option disabled value="">Please select one</option>
                                                    <option v-for="category in categories"
                                                        v-bind:value="category.down2Uid">
                                                        {{ category.rootName }}/{{ category.down1Name }}/{{ category.down2Name }}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="pubUid">출판사</label>
                                                <input v-model.number.trim="pubUid" class="form-control"
                                                    :readonly="!isEditable">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-4">
                                            <p>내용</p>
                                        </div>
                                        <div class="col-8">
                                            <div class="form-group">
                                                <textarea :value="content" @input="content=$event.target.value"
                                                    class="form-control" :readonly="!isEditable"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                                    <button type="button" @click="editMode" class="btn btn-primary"
                                        :disabled="isEditable">수정</button>
                                    <button type="submit" @click.prevent="updateItem" class="btn btn-primary"
                                        :disabled="!isEditable">완료</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>

            </v-app>
        </div>
    </div>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@5.x/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
    <script src="../JS/product/main.js"></script>
</body>

</html>