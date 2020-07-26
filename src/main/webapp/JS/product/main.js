/**
 * 
 */
let app = new Vue({
    el: '#app',
    data: {
        posts: []
    },
    created() {
        this.getList();
        this.EventBus.$on('refresh', this.getList);
    },
    methods: {
        getList: function () {
            axios.get(`http://localhost:8109/yes25_project/products/ajax/list.ajax`, {
                    "page": 1
                })
                .then((result) => {
                    console.log('리스트 가져오기 성공')
                    console.log(result);
                    this.posts = result.data;
                })
                .catch(error => {
                    console.log('리스트 가져오기 실패', error)
                });

        },
        viewItem: function (event) {
            axios.post(`http://localhost:8109/yes25_project/products/ajax/view.ajax`, {
                    "bookUid": event.target.parentNode.parentNode.firstChild.innerText
                })
                .then((result) => {
                    console.log(result);
                    this.EventBus.$emit('viewItem', result);
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