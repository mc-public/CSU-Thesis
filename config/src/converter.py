import os
import docx2pdf
from pathlib import Path

def convert_docx_to_pdf(file_path: list[os.PathLike | str], output_dir: str) -> None:
    if not os.path.exists(output_dir):
        raise FileNotFoundError(f"The directory {output_dir} does not exist.")
    for docx_path in file_path:
        if not os.path.exists(docx_path):
            raise FileNotFoundError(f"The docx file does not exist: {docx_path}")
        
        base_name = os.path.basename(docx_path)
        file_name_without_ext, _ = os.path.splitext(base_name)
        pdf_output_path = os.path.join(output_dir, f"{file_name_without_ext}.pdf")
        
        try:
            docx2pdf.convert(docx_path, pdf_output_path)
        except Exception as e:
            raise RuntimeError(f"File {docx_path} conversion failed: {str(e)}")

        if not os.path.exists(pdf_output_path):
            raise FileNotFoundError(f"Conversion failed, expected PDF file not found: {pdf_output_path}. Please install **Microsoft Word** in order to use docx2pdf for conversion.")

if __name__ == "__main__":
    docx_dir = Path(os.path.abspath(os.path.dirname(__file__))) / ".." / "docx"
    pdf_dir = Path(os.path.abspath(os.path.dirname(__file__))) / ".." / "pdf"
    # find all docx files in the docx directory
    all_docx_files = []
    for file in os.listdir(docx_dir):
        if file.endswith(".docx"):
            all_docx_files.append(os.path.join(docx_dir, file))
    try:
        convert_docx_to_pdf(all_docx_files, pdf_dir)
    except Exception as e:
        print(f"Error during conversion: {str(e)}")
        print("Please ensure you have **Microsoft Word** installed and try again.")