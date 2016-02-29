use Spreadsheet::WriteExcel;
use MIME::Lite;


    # Create a new Excel workbook
    my $filename = 'sample_new';
    my $workbook = Spreadsheet::WriteExcel->new($filename.'_excel.xls');

    # Add a worksheet
    $worksheet = $workbook->add_worksheet();

    #  Add and define a format
    $format = $workbook->add_format(); # Add a format
    $format->set_bold();
    $format->set_color('Black');
    $format->set_align('center');

    # Write a formatted and unformatted string, row and column notation.
    my $col = $row = 0;
#    $worksheet->write($row, $col, 'Employee ID', $format);
#    $worksheet->write($row, $col+1, 'Employee Name', $format);
#    $worksheet->write($row, $col+2, 'Employee Address', $format);
#    $worksheet->write($row, $col+3, 'Employee Email_ID', $format);
#    $worksheet->write($row, $col+4, 'Employee Phone NO', $format);
    
    
    $worksheet->write($row, 0, 'Employee ID', $format);
    $worksheet->write($row, 1, 'Employee Name', $format);
    $worksheet->write($row, 2, 'Employee Address', $format);
    $worksheet->write($row, 3, 'Employee Email_ID', $format);
    $worksheet->write($row, 4, 'Employee Phone NO', $format);
    
    
    #$col = $row = 0;
    #$worksheet->write(1,    $col, 'Sumit');
    #$worksheet->write(2,    $col, 'Zaheer');

    # Write a number and a formula using A1 notation
    $worksheet->write('A2', 26225);
    $worksheet->write('B2', 'Sumit');
    $worksheet->write('C2', 'Bangalore');
    $worksheet->write('D2', 'skr4friends@gmail.com');
    $worksheet->write('E2', 9844816548);
    
    
    $workbook->close();
    
    &send_email();
    
    sub send_email {
    	### Create a new multipart message:
    	$msg = MIME::Lite->new(
	        From    => 'skr4friends@gmail.com',
	        To      => 'sumit_skr@hotmail.com',
	        Subject => 'A message with 2 parts...',
	        Type    => 'multipart/mixed'
    	);

    ### Add parts (each "attach" has same arguments as "new"):
    $msg->attach(
        Type     => 'TEXT',
        Data     => "Here's the GIF file you wanted"
    );
    $msg->attach(
        Type     => 'image/gif',
        Path     => 'Vector_Field.gif',
        Filename => 'butterfly.gif',
        Disposition => 'attachment'
    );
    ### use Net:SMTP to do the sending
    $msg->send('smtp','smtp.live.com', Debug=>1);
    
    print "\n Email send with attachement \n";
    	
    	
    }
    