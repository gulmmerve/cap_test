using { sap.capire.bookshop as my } from '../db/schema';

@path: '/browse'
@impl: './my-service.js'
service CatalogService {
    @readonly entity Books as select from my.Books {*} excluding {createdBy, modifiedBy};

    @requires_: 'authenticated-user'
    @insteronly entity Orders as projection on my.Orders;
}