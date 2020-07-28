/**
 * 
 */
let app = new Vue({
    el: '#app',
    data: {
        posts: [],
        file: null,
        url: '',
        subject: '',
        author: '',
        price: '',
        content: '',
        categoryUid: '',
        pubUid: '',
        count: '0',
        page: 1,
        pageRows: 5,
        writePages: 5,
        startPage: 1,
        endPage: '',
        isEditable: false,
    },
    created() {
        this.getList();
    },
    methods: {
        getList: function () {
            console.log(this.page);
            let formData = new FormData();
            formData.append('page', this.page);
            formData.append('pageRows', this.pageRows);

            axios.post(`http://localhost:8109/yes25_project/products/ajax/list.ajax`, formData

                )
                .then((result) => {
                    console.log('리스트 가져오기 성공')
                    console.log(result);
                    console.log(result.data.data);

                    this.count = result.data.count;
                    this.posts = result.data.data;
                    this.endPage = parseInt((this.count - 1) / this.pageRows) + 1;
                    console.log(this.endPage);
                })
                .catch(error => {
                    console.log('리스트 가져오기 실패', error)
                });

        },
        curPage: function (e) {
            console.log(e.target.innerText);
            this.page = parseInt(e.target.innerText);
            this.getList();
        },
        prevPage: function (e) {
            this.startPage = parseInt(((this.page - 1) / this.writePages) - 1) * this.writePages + 1;
            console.log(this.startPage);
            this.page = this.startPage;
            this.getList();
        },
        nextPage: function (e) {
            this.startPage = parseInt(((this.page - 1) / this.writePages) + 1) * this.writePages + 1;
            console.log(this.startPage);
            this.page = this.startPage;
            this.getList();
        },
        changeRows: function () {
            this.pageRows = 10;
            this.getList();
        },
        editMode: function(){
            this.isEditable = true;
        },
        clearForm: function () {
            this.subject = '';
            this.author = '';
            this.price = '';
            this.content = '';
            this.categoryUid = '';
            this.pubUid = '';
            this.url = '';
            this.file = null;
            this.$refs.myFileInput.value = '';
        },
        onFileChange(e) {
            const file = e.target.files[0];
            console.log(file);
            this.file = file;
            this.url = URL.createObjectURL(file);
        },
        onDrop(e) {
            const file = e.dataTransfer.files[0];
            this.file = file;
            this.url = URL.createObjectURL(file);
        },
        imageUpload(bookUid) {
            let formData = new FormData();
            formData.append('file', this.file);
            formData.append('bookuid', bookUid);

            axios.post('http://localhost:8109/yes25_project/products/ajax/upload.ajax',
                formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                }).then(function () {
                console.log('사진 업로드 성공!!');
                // this.getList();

            }).catch(function () {
                console.log('사진 업로드 실패!!');
            });

        },
        submitForm: function () {
            axios.post(`http://localhost:8109/yes25_project/products/ajax/insert.ajax`, {
                    "subject": this.subject,
                    "author": this.author,
                    "price": this.price,
                    "content": this.content,
                    "categoryUid": this.categoryUid,
                    "pubUid": this.pubUid,
                })
                .then((result) => {
                    console.log("폼 서밋 완료");
                    const bookUid = result.data;
                    if (this.file != null) {
                        this.imageUpload(bookUid);
                    }
                    setTimeout(() => {
                        this.getList();
                    }, 100);

                    this.clearForm();

                })
                .catch(error => {
                    console.log('failed', error)
                });

        },
        maxLengthCheck: function (event) {
            const value = event.target.value;
            console.log(value, this.price);
            if (String(value).length > 7) {
                this.price = String(value).slice(0, 7);
            }

        },
        viewItem: function (event) {
            this.bookUid = event.target.parentNode.parentNode.parentNode.firstChild.innerText;
            axios.post(`http://localhost:8109/yes25_project/products/ajax/view.ajax`, {
                    "bookUid": this.bookUid
                })
                .then((result) => {
                    this.clearForm();
                    console.log(result);
                    this.isEditable = false;
                    this.subject = result.data.data[0].subject;
                    this.author = result.data.data[0].author;
                    this.price = result.data.data[0].price;
                    this.categoryUid = result.data.data[0].categoryUid;
                    this.pubUid = result.data.data[0].pubUid;
                    this.content = result.data.data[0].content;
                    this.url = result.data.data[0].serName;

                    console.log(this.subject);
                })
                .catch(error => {
                    console.log('failed', error)
                });

        },
        updateItem: function () {
            axios.post(`http://localhost:8109/yes25_project/products/ajax/update.ajax`, {
                    "bookUid": this.bookUid,
                    "subject": this.subject,
                    "author": this.author,
                    "price": this.price,
                    "content": this.content,
                    "categoryUid": this.categoryUid,
                    "pubUid": this.pubUid,

                })

                .then((result) => {
                    console.log(result);
                    this.isEditable = false;
                    this.getList();
                })
                .catch(error => {
                    console.log('failed', error)
                });
        },
        deleteItem: function (event) {
            console.log(event.target.parentNode.parentNode.firstChild.innerText);

            axios.post(`http://localhost:8109/yes25_project/products/ajax/delete.ajax`, {
                    "bookUid": event.target.parentNode.parentNode.firstChild.innerText
                })
                .then((result) => {
                    console.log(result);
                    this.getList();
                })
                .catch(error => {
                    console.log('failed', error)
                });
        }
    },

});