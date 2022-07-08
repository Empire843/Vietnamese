<div class="col-lg-8">
    <div class="card shadow-sm mau">
        <div class="card-header bg-transparent">
            <h3>Thông tin khách hàng</h3>
        </div>
        <div class="card-body">
            <table class="table">
                <tr>
                    <th width="30%">Họ và tên</th>
                    <td>
                        <input type="text" id="ten"></input>
                    </td>
                </tr>
                <tr>
                    <th width="30%">Giới tính</th>
                    <td>
                        <input type="number" id="sinh"></input>
                    </td>
                </tr>
                <tr>
                    <th width="30%">Giới tính</th>
                    <td>
                        <input type="text" id="gioitinh"></input>
                    </td>
                </tr>
                <tr>
                    <th width="30%">Quê quán</th>
                    <td>
                        <input type="text" id="diachi"></input>
                    </td>
                </tr>
                <tr>
                    <th width="30%">Tên đăng nhập</th>
                    <td>
                        <input type="text" id="email"></input>
                    </td>
                </tr>
                <tr>
                    <th width="30%">Mật khẩu</th>
                    <td>
                        <input type="password" id="password"></input>
                    </td>
                </tr>

            </table>
            <td>
                <button class="card-header2" onclick="add()">Cập nhật thông tin khách
                    hàng</button>
                <!-- <button class="card-header2" onclick="editItem()">Sửa thông tin khách
                                            hàng</button> -->
            </td>
            <table class="table" id="render">
                <!--                                        <th>Tên</th>
                                        <th>Năm sinh</th>
                                        <th>Giới Tính</th>
                                        <th>Địa chỉ</th>
                                        <th>Email</th>
                                        <th>Password</th>-->
            </table>

        </div>
    </div>
    <div style="height: 25px"></div>
    <div class="card shadow-sm mau">
        <div class="card-header bg-transparent ">
            <h3 class="">Giới thiệu về bản thân</h3>
        </div>
        <div class="card-body">
            <p>Hello</p>
        </div>
    </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>