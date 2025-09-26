from flask import Flask

app = Flask(__name__)

@app.route('/')
def say_hello():
    return """
        <p>Welcome!</p>
        <a href="/about">About this App</a><br>
        <a href="/contact">Contact Me</a>
    """

@app.route('/about')
def about_page():
    return """
        <p>This application is running on the Flask web framework.</p>
        <a href="https://flask.palletsprojects.com/">Learn more about Flask</a>
    """

@app.route('/contact')
def contact_page():
    return "<p>Contact me at C22431396@mytudublin.ie</p>"
@app.route('/contact')
def contact_page():
    return "<p>Contact me at C22431396@mytudublin.ie</p>"

@app.route('/')
def say_hello():
    return """
        <p>Hello, World, I am a Flask app!</p>
        <a href="/about">About this App</a><br>
        <a href="/contact">Contact Me</a> 
    """