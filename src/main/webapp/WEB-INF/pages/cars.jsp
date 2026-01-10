<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Cars">
    <h1>Cars</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Cars">

            <%-- Afișăm butoanele de Add și Delete DOAR dacă userul are drept de scriere --%>
        <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/AddCar" role="button">Add Car</a>
            <button class="btn btn-danger" type="submit">Delete Cars</button>
        </c:if>

        <div class="container text-center mt-4">
            <c:forEach var="car" items="${cars}">
                <div class="row mb-2">
                    <div class="col">
                            <%-- Checkbox-ul apare doar pentru cine poate șterge --%>
                        <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                            <input type="checkbox" name="car_ids" value="${car.id}" />
                        </c:if>
                    </div>
                    <div class="col">
                            ${car.licensePlate}
                    </div>
                    <div class="col">
                            ${car.parkingSpot}
                    </div>
                    <div class="col">
                            ${car.ownerName}
                    </div>
                    <div class="col">
                            <%-- Butonul de Edit apare doar pentru cine are drept de scriere --%>
                        <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditCar?id=${car.id}">Edit Car</a>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>
    </form>
    <h5 class="mt-4">Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>