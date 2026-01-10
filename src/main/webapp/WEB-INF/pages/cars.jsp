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
                <div class="row mb-2 align-items-center"> <%-- Am adăugat align-items-center pentru aliniere verticală --%>
                    <div class="col">
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
                        <img src="${pageContext.request.contextPath}/CarPhotos?id=${car.id}" width="48"/>
                    </div>

                        <%-- Secțiunea cu butoane --%>
                    <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                        <div class="col-4"> <%-- Folosim col-4 pentru a oferi mai mult spațiu orizontal butoanelor --%>
                            <a class="btn btn-secondary"
                               href="${pageContext.request.contextPath}/AddCarPhoto?id=${car.id}" role="button">Add photo</a>
                            <a class="btn btn-secondary"
                               href="${pageContext.request.contextPath}/EditCar?id=${car.id}">Edit Car</a>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </form>
    <h5 class="mt-4">Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>