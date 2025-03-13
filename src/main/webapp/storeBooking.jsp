<%@ page import="com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>
<%@ page contentType="application/pdf" %>
<%
    // Retrieve form data from the submitted form
    String fullName = request.getParameter("full_name");
    String address = request.getParameter("address");
    String nic = request.getParameter("nic");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String fromLocation = request.getParameter("from_location");
    String toLocation = request.getParameter("to_location");
    String vehicleModel = request.getParameter("vehicle_model");
    String rentPrice = request.getParameter("rent_price");

    try {
        // Create PDF document
        Document document = new Document(PageSize.A4);
        
        // Set content type to PDF
        response.setContentType("application/pdf");
        
        // Suggest to the browser that the content should be downloaded as an attachment
        response.setHeader("Content-Disposition", "attachment; filename=\"ticket.pdf\"");
        
        // Create a PDF writer that writes to the response output stream
        PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
        
        // Open the document to write content
        document.open();
        
        // Add title to the PDF
        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 22, BaseColor.BLACK);
        Paragraph title = new Paragraph("Booking Receipt", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        document.add(title);
        
        // Add a custom line separator using Chunk
        document.add(new Chunk("---------------------------------------------------"));
        
        // Add some space
        document.add(Chunk.NEWLINE);
        
        // Add receipt heading
        Font sectionFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14, BaseColor.BLACK);
        Paragraph detailsHeading = new Paragraph("Booking Details", sectionFont);
        detailsHeading.setAlignment(Element.ALIGN_LEFT);
        document.add(detailsHeading);
        
        // Add booking details inside a bordered table
        PdfPTable table = new PdfPTable(2); // Two columns for field and value
        table.setWidthPercentage(100);
        table.setSpacingBefore(10f);
        table.setSpacingAfter(10f);
        
        // Add headers with bold style
        PdfPCell cell = new PdfPCell(new Phrase("Field", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);
        cell = new PdfPCell(new Phrase("Details", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);
        
        // Add data to the table with padding and borders
        table.addCell("Full Name:");
        table.addCell(fullName);
        
        table.addCell("Address:");
        table.addCell(address);
        
        table.addCell("NIC:");
        table.addCell(nic);
        
        table.addCell("Phone:");
        table.addCell(phone);
        
        table.addCell("Email:");
        table.addCell(email);
        
        table.addCell("From Location:");
        table.addCell(fromLocation);
        
        table.addCell("To Location:");
        table.addCell(toLocation);
        
        table.addCell("Vehicle Model:");
        table.addCell(vehicleModel);
        
        table.addCell("Rent Price:");
        table.addCell("LKR " + rentPrice);
        
        // Add the table to the document
        document.add(table);
        
        // Add some space
        document.add(Chunk.NEWLINE);
        
        // Add footer with "Thank you" message
        Paragraph footer = new Paragraph("Thank you for booking with us! Enjoy your trip!", FontFactory.getFont(FontFactory.HELVETICA, 10, BaseColor.GRAY));
        footer.setAlignment(Element.ALIGN_CENTER);
        document.add(footer);
        
        // Close the document to complete the PDF
        document.close();
    } catch (Exception e) {
        // Handle any errors during PDF generation
        e.printStackTrace();
        out.println("<script>alert('Error generating ticket. Try again.'); window.history.back();</script>");
    }
%>
