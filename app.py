from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return '<h1>Success! The Flask App is running automatically via Vagrant!</h1>'

if __name__ == '__main__':
    # The host='0.0.0.0' is crucial to make the app accessible
    # from outside the virtual machine.
    app.run(host='0.0.0.0')