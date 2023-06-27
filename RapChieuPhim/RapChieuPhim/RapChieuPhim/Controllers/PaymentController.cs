using Google.Rpc;
using MoMo;
using Newtonsoft.Json.Linq;
using RapChieuPhim.Dao;
using RapChieuPhim.Models;
using RapChieuPhim.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RapChieuPhim.Controllers
{
    public class PaymentController : Controller
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        // GET:
        public ActionResult SendOrder(int order)
        {


            //request params need to request to MoMo system
            string endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";
            var dao = new VeDao();
            Ve ve = dao.GetLoaiPhimFindByID(order);
            string partnerCode = "MOMO_ATM_DEV";
            string accessKey = "w9gEg8bjA2AM2Cvr";
            string serectkey = "mD9QAVi4cm9N844jh5Y2tqjWaaJoGVFM";
            string orderInfo = "Mua Vé Xem Phim"+ve.TaiKhoan.ThongTin.TenNguoiDung+""+ve.LichChieu.Phim.TenPhim;
            string redirectUrl = "https://localhost:44341/Payment?";
            string ipnUrl = "https://localhost:44341/Payment?";
            string requestType = "captureWallet";
            var price = ve.GiaVe.ToString().Replace(".00","");
            string amount = price;
            string orderId = order.ToString();
            string requestId = order.ToString();
            string extraData = "";

            //Before sign HMAC SHA256 signature
            string rawHash = "accessKey=" + accessKey +
                "&amount=" + amount +
                "&extraData=" + extraData +
                "&ipnUrl=" + ipnUrl +
                "&orderId=" + orderId +
                "&orderInfo=" + orderInfo +
                "&partnerCode=" + partnerCode +
                "&redirectUrl=" + redirectUrl +
                "&requestId=" + requestId +
                "&requestType=" + requestType
                ;

            log.Debug("rawHash = " + rawHash);

            MoMoSecurity crypto = new MoMoSecurity();
            //sign signature SHA256
            string signature = crypto.signSHA256(rawHash, serectkey);
            log.Debug("Signature = " + signature);

            //build body json request
            JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "partnerName", "Test" },
                { "storeId", "MomoTestStore" },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderId },
                { "orderInfo", orderInfo },
                { "redirectUrl", redirectUrl },
                { "ipnUrl", ipnUrl },
                { "lang", "en" },
                { "extraData", extraData },
                { "requestType", requestType },
                { "signature", signature }

            };
            log.Debug("Json request to MoMo: " + message.ToString());
            string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());

            JObject jmessage = JObject.Parse(responseFromMomo);
            log.Debug("Return from MoMo: " + jmessage.ToString());
            String u= jmessage.GetValue("payUrl").ToString() ;
            return Redirect(jmessage.GetValue("payUrl").ToString());
        }
        public ActionResult Index(int orderId, int resultCode)
        {
            int idghe = (int)Session["IDG"];
            var gheDao = new GheDao();
            var veDao = new VeDao();
            var phimDao = new PhimDao();
            Ghe ghe = gheDao.GetGheFindByID(idghe);
            Ve ve = veDao.GetLoaiPhimFindByID(orderId);
            PhimViewModel phimmodel = phimDao.getPhimFindbyId(ve.LichChieu.IdPhim);

            ViewData["phimmodel"] = phimmodel;
            ViewData["VeData"] = ve;
            ViewData["lichChieu"] = ve.LichChieu;
            ViewData["Ghe"] = ghe;
            ViewData["RAP"] = ve.RapPhim;
            if (resultCode == 0)
            {
                return View();

            }
            return Redirect("/Error");
        }
    }
}
